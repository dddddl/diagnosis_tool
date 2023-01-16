import 'dart:typed_data';

class MiniLZO {
  int blockSize = 128 * 1024;
  int minNewSize = 0;
  int maxSize = 0;

  int OK = 0;
  int INPUT_OVERRUN = -4;
  int OUTPUT_OVERRUN = -5;
  int LOOKBEHIND_OVERRUN = -6;
  int EOF_FOUND = -999;
  int ret = 0;

  Uint8List buf = Uint8List(0);
  Uint32List buf32 = Uint32List(0);

  Uint8List out = Uint8List(256 * 1024);
  int cbl = 0;
  int ip_end = 0;
  int op_end = 0;
  int t = 0;

  int ip = 0;
  int op = 0;
  int m_pos = 0;
  int m_len = 0;
  int m_off = 0;

  int dv_hi = 0;
  int dv_lo = 0;
  int dindex = 0;

  int ii = 0;
  int jj = 0;
  int tt = 0;
  int v = 0;

  Uint32List dict = Uint32List(16384);
  Uint32List emptyDict = Uint32List(16384);

  bool skipToFirstLiteralFun = false;
  bool returnNewBuffers = true;

  Uint8List outputBuffer = Uint8List(0);

  void setBlockSize(int blockSize) {
    if (blockSize is int && blockSize > 0) {
      this.blockSize = blockSize;
      this.minNewSize = blockSize;
    }
  }

  void setOutputSize(int outputSize) {
    if (outputSize is int && outputSize > 0) {
      this.out = Uint8List(outputSize);
    }
  }

  void setReturnNewBuffers(bool b) {
    this.returnNewBuffers = b;
  }

  void applyConfig(Map<String, dynamic> cfg) {
    if (cfg != null) {
      if (cfg['outputSize'] != null) {
        setOutputSize(cfg['outputSize']);
      }
      if (cfg['blockSize'] != null) {
        setBlockSize(cfg['blockSize']);
      }
    }
  }

  int ctzl(int v) {
    int c;
    if (v & 0x1 == 1) {
      c = 0;
    } else {
      c = 1;
      if ((v & 0xffff) == 0) {
        v >>= 16;
        c += 16;
      }
      if ((v & 0xff) == 0) {
        v >>= 8;
        c += 8;
      }
      if ((v & 0xf) == 0) {
        v >>= 4;
        c += 4;
      }
      if ((v & 0x3) == 0) {
        v >>= 2;
        c += 2;
      }
      c -= v & 0x1;
    }
    return c;
  }

  void extendBuffer() {
    print('extendBuffer');
    Uint8List newBuffer =
        Uint8List(minNewSize + (blockSize - minNewSize % blockSize));
    newBuffer.setRange(0, out.length, out);
    out = newBuffer;
    cbl = out.length;
  }

  void match_next() {
    minNewSize = op + 3;
    if (minNewSize > cbl) {
      extendBuffer();
    }
    out[op++] = buf[ip++];
    if (t > 1) {
      out[op++] = buf[ip++];
      if (t > 2) {
        out[op++] = buf[ip++];
      }
    }
    t = buf[ip++];
  }

  int match_done() {
    t = buf[ip - 2] & 3;
    return t;
  }

  void copy_match() {
    t += 2;
    minNewSize = op + t;
    print('copy_match minNewSize $minNewSize  cbl $cbl');
    if (minNewSize > cbl) {
      extendBuffer();
    }

    do {
      print('op $op m_pos $m_pos');
      out[op++] = out[m_pos++];
    } while (--t > 0);
  }

  void copy_from_buf() {
    minNewSize = op + t;
    print('copy_from_buf minNewSize $minNewSize  cbl $cbl');
    if (minNewSize > cbl) {
      extendBuffer();
    }

    do {
      out[op++] = buf[ip++];
    } while (--t > 0);
  }

  int match() {
    for (;;) {
      if (t >= 64) {
        print('m_pos $m_pos');
        m_pos = (op - 1) - ((t >> 2) & 7) - (buf[ip++] << 3);
        print('m_pos $m_pos');
        t = (t >> 5) - 1;
        copy_match();
      } else if (t >= 32) {
        t &= 31;
        if (t == 0) {
          while (buf[ip] == 0) {
            t += 255;
            ip++;
          }
          t += 31 + buf[ip++];
        }

        m_pos = (op - 1) - (buf[ip] >> 2) - (buf[ip + 1] << 6);
        ip += 2;
        copy_match();
      } else if (t >= 16) {
        m_pos = op - ((t & 8) << 11);

        t &= 7;
        if (t == 0) {
          while (buf[ip] == 0) {
            t += 255;
            ip++;
          }
          t += 7 + buf[ip++];
        }

        m_pos -= (buf[ip] >> 2) + (buf[ip + 1] << 6);
        ip += 2;

        if (m_pos == op) {
          outputBuffer = returnNewBuffers
              ? Uint8List.fromList(out.sublist(0, op))
              : out.sublist(0, op);
          return EOF_FOUND;
        } else {
          m_pos -= 0x4000;
          copy_match();
        }
      } else {
        m_pos = (op - 1) - (t >> 2) - (buf[ip++] << 2);
        minNewSize = op + 2;
        if (minNewSize > cbl) {
          extendBuffer();
        }

        out[op++] = out[m_pos++];
        out[op++] = out[m_pos];
      }
      if (match_done() == 0) {
        return OK;
      }
      match_next();
    }
  }

  int decompress(Uint8List inputBuffer) {
    buf = inputBuffer;
    cbl = out.length;
    ip_end = buf.length;
    t = 0;
    ip = 0;
    op = 0;
    m_pos = 0;
    skipToFirstLiteralFun = false;
    print("buf[ip] ${buf[ip]}");
    if (buf[ip] > 17) {
      t = buf[ip++] - 17;
      if (t < 4) {
        match_next();
        int ret = match();
        if (ret != OK) {
          return ret == EOF_FOUND ? OK : ret;
        }
      } else {
        copy_from_buf();
        skipToFirstLiteralFun = true;
      }
    }

    for (;;) {
      if (!skipToFirstLiteralFun) {
        t = buf[ip++];
        if (t >= 16) {
          int ret = match();
          if (ret != OK) {
            return ret == EOF_FOUND ? OK : ret;
          }
          continue;
        } else if (t == 0) {
          while (buf[ip] == 0) {
            t += 255;
            ip++;
          }
          t += 15 + buf[ip++];
        }
        t += 3;
        copy_from_buf();
      } else {
        skipToFirstLiteralFun = false;
      }

      t = buf[ip++];
      if (t < 16) {
        m_pos = op - (1 + 0x0800);
        m_pos -= t >> 2;
        m_pos -= buf[ip++] << 2;
        int minNewSize = op + 3;
        if (minNewSize > cbl) {
          extendBuffer();
        }
        out[op++] = out[m_pos++];
        out[op++] = out[m_pos++];
        out[op++] = out[m_pos];

        if (match_done() == 0) {
          continue;
        } else {
          match_next();
        }
      }
      int ret = match();
      if (ret != OK) {
        return ret == EOF_FOUND ? OK : ret;
      }
    }
    return OK;
  }
}
