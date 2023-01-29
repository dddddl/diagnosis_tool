(function(global, define) {

  // define module and also export to global
  define(function (require, exports, module) {
      return lzo1x;
  });

  // Auto expandable read/write buffer of TypedArray
  function FlexBuffer() {
    return {
      require: function(n) {
        var r = this.c - this.l + n;
        if (r > 0) {
          var tmp = new Uint8Array(this.l += this.blockSize * Math.ceil(r / this.blockSize ));
          tmp.set(this.buf);
          this.buf = tmp;
        }
        this.c += n;
        return this.buf;
      },
      alloc: function(initSize, blockSize) {
        this.blockSize = this.roundUp(blockSize || 4096);
        this.c = 0;
        this.l = this.roundUp(initSize)|0;
        this.l += this.blockSize - (this.l % this.blockSize);
        this.buf = new Uint8Array(this.l);
        return this.buf;
      },
      roundUp: function (n) {
        var r = n % 4;
        return r === 0 ? n : n + 4 - r;
      },
      reset: function() {
        this.c = 0;
        this.l = this.buf.length;
      },
      pack: function(size) { return this.buf.subarray(0, size); },
    };
  }


var lzo1x = (function () {

  function decompress(inBuf, outBuf) {
    var c_top_loop = 1;
    var c_first_literal_run = 2;
    var c_match = 3;
    var c_copy_match = 4;
    var c_match_done = 5;
    var c_match_next = 6;

    var out = outBuf.buf,
        op = 0,
        ip = 0,
        t = inBuf[ip],
        state = c_top_loop,
        m_pos = 0,
        ip_end = inBuf.length;


    return outBuf.pack(op);
  }


  return {

    decompress: function(input, options, blockSize) {
      var output;
      if (options.require instanceof Function) {
        output = options;
        output.reset();
      } else {
        if (typeof options === 'number') {
          options = {initSize: options, blockSize: blockSize || 8192};
        }
        output = this.createFlexBuffer(options.initSize || input.length, options.blockSize || 8192);
      }
      return decompress(input, output);
    },
    createFlexBuffer: function(initSize, blockSize) {
      var output = FlexBuffer();
      output.alloc(initSize, blockSize);
      return output;
    }
  };
})();

}( this, // refers to global

   typeof module === 'object' && typeof define !== 'function'
     ? function (factory) { module.exports = factory(require, exports, module); }
     : define
));