import 'dart:typed_data';

class FlexBuffer {
  int c = 0;
  int l = 0;
  int blockSize = 0;
  late Uint8List buf;

  Uint8List require(int n) {
    var r = c - l + n;
    if (r > 0) {
      var tmp = Uint8List(l += blockSize * (r / blockSize).ceil());
      tmp.setRange(0, buf.length, buf);
      buf = tmp;
    }
    c += n;
    return buf;
  }

  Uint8List alloc(int initSize, [int blockSize = 4096]) {
    this.blockSize = roundUp(blockSize);
    c = 0;
    l = roundUp(initSize);
    l += this.blockSize - (l % this.blockSize);
    buf = Uint8List(l);
    return buf;
  }

  int roundUp(int n) {
    var r = n % 4;
    return r == 0 ? n : n + 4 - r;
  }

  void reset() {
    c = 0;
    l = buf.length;
  }

  Uint8List pack(int size) {
    return buf.sublist(0, size);
  }
}

class Lzo1x {
  static Uint8List decompress(Uint8List inBuf, FlexBuffer outBuf) {
    const c_top_loop = 1;
    const c_first_literal_run = 2;
    const c_match = 3;
    const c_copy_match = 4;
    const c_match_done = 5;
    const c_match_next = 6;

    var out = outBuf.buf,
        op = 0,
        ip = 0,
        t = inBuf[ip],
        state = c_top_loop,
        m_pos = 0,
        ip_end = inBuf.length;

    if (t > 17) {
      print('t > 17');
      ip++;
      t -= 17;
      if (t < 4) {
        state = c_match_next;
      } else {
        print('t >= 4');
        out = outBuf.require(t);
        for (var i = 0; i < t; i++) {
          out[op++] = inBuf[ip++];
        }
        state = c_first_literal_run;
      }
    }

    var if_block = false;
    top_loop_ori:
    do {
      switch (state) {
        // while (true)  top_loop_ori
        case c_top_loop:
          t = inBuf[ip++];
          if (t >= 16) {
            print('c_top_loop set c_match');
            if_block = false;
            state = c_match;
            continue top_loop_ori;
          }
          if (t == 0) {
            while (inBuf[ip] == 0) {
              t += 255;
              ip++;
            }
            t += 15 + inBuf[ip++];
          }

          t += 3;
          out = outBuf.require(t);
          ip = 0;
          print('out size ${out.length} inBuf size ${inBuf.length} op $op ip $ip  t $t');

          for (int i = 0; i < t; i++) {

            out[op++] = inBuf[ip++];
          }

          print('c_top_loop set state c_first_literal_run');
          state = c_first_literal_run;
          continue top_loop_ori;

        case c_first_literal_run:
          t = inBuf[ip++];
          print('t = $t');
          if (t >= 16) {
            print('c_first_literal_run set c_match');
            if_block = false;
            state = c_match;
            continue top_loop_ori;
          }
          m_pos = op - 0x801 - (t >> 2) - (inBuf[ip++] << 2);
          out = outBuf.require(3);
          out[op++] = out[m_pos++];
          out[op++] = out[m_pos++];
          out[op++] = out[m_pos];

          if_block = false;
          state = c_match_done;
          continue top_loop_ori;

        case c_match:
          if (t >= 64) {
            m_pos = op - 1 - ((t >> 2) & 7) - (inBuf[ip++] << 3);
            print('m_pos = $m_pos');

            t = (t >> 5) - 1;
            print('c_match set state c_copy_match');
            if_block = false;
            state = c_copy_match;
            continue top_loop_ori;
          } else if (t >= 32) {
            t &= 31;
            if (t == 0) {
              while (inBuf[ip] == 0) {
                t += 255;
                ip++;
              }
              t += 31 + inBuf[ip++];
            }
            m_pos = op - 1 - ((inBuf[ip] + (inBuf[ip + 1] << 8)) >> 2);

            ip += 2;
          } else if (t >= 16) {
            m_pos = op - ((t & 8) << 11);
            t &= 7;
            if (t == 0) {
              while (inBuf[ip] == 0) {
                t += 255;
                ip++;
              }
              t += 7 + inBuf[ip++];
            }
            m_pos -= ((inBuf[ip] + (inBuf[ip + 1] << 8)) >>
                2); //m_pos -= (* (const unsigned short *) ip) >> 2;
            ip += 2;
            if (m_pos == op) {
              print('break');
              break top_loop_ori;
            }
            m_pos -= 0x4000;
          } else {
            m_pos = op - 1 - (t >> 2) - (inBuf[ip++] << 2);
            out = outBuf.require(2);
            out[op++] = out[m_pos++];
            out[op++] = out[m_pos];
            if_block = false;
            state = c_match_done;
            continue top_loop_ori;
          }
          if (t >= 6 && (op - m_pos) >= 4) {
            if_block = true;
            t += 2;
            out = outBuf.require(t);
            do {
              out[op++] = out[m_pos++];
            } while (--t > 0);
          }

          print('c_match set state c_match_done');
          state = c_copy_match;
          continue top_loop_ori;

        case c_copy_match:
          if (!if_block) {
            t += 2;
            out = outBuf.require(t);
            do {
              print('op: $op, m_pos: $m_pos');
              out[op++] = out[m_pos++];
            } while (--t > 0);
          }

          print('c_copy_match set state c_match_done');
          state = c_match_done;
          continue top_loop_ori;
        case c_match_done:
          t = inBuf[ip - 2] & 3;
          if (t == 0) {
            if_block = false;
            state = c_top_loop;
            continue top_loop_ori;
          }

          print('c_match_done set state c_match_next');
          state = c_match_next;
          continue top_loop_ori;

        case c_match_next:
          out = outBuf.require(1);
          out[op++] = inBuf[ip++];
          if (t > 1) {
            out = outBuf.require(1);
            out[op++] = inBuf[ip++];
            if (t > 2) {
              out = outBuf.require(1);
              out[op++] = inBuf[ip++];
            }
          }
          t = inBuf[ip++];
          print('c_match_next set state c_match');
          if_block = false;
          state = c_match;
          continue top_loop_ori;
      }
    } while (true);

    return outBuf.pack(op);
  }


  static FlexBuffer createFlexBuffer(int initSize, [int blockSize = 4096]) {
    var output = FlexBuffer();
    output.alloc(initSize, blockSize);
    return output;
  }

  static Uint8List decompressFunc(Uint8List input, dynamic options, [int? blockSize]) {
    FlexBuffer output;
    if (options is FlexBuffer) {
      output = options;
      output.reset();
    } else {
      if (options is int) {
        options = {'initSize': options, 'blockSize': blockSize ?? 8192};
      }
      output = createFlexBuffer(options['initSize'] ?? input.length, options['blockSize'] ?? 8192);
    }
    return decompress(input, output);
  }
}
