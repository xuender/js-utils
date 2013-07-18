// Generated by CoffeeScript 1.6.3
var iconv;

iconv = {
  toBig5: function(str) {
    var code, gbkcode, i, ret, _i, _len;
    ret = [];
    for (_i = 0, _len = str.length; _i < _len; _i++) {
      i = str[_i];
      if (i === ' ') {
        ret.push('+');
        continue;
      }
      code = i.charCodeAt(0);
      if (code >> 7) {
        gbkcode = this.big5[code];
        ret.push('%');
        ret.push((gbkcode >> 8).toString(16).toUpperCase());
        ret.push(String.fromCharCode(gbkcode & 0xFF));
      } else {
        ret.push(String.fromCharCode(code));
      }
    }
    return ret.join('');
  },
  toGbk: function(str) {
    var code, gbkcode, i, ret, _i, _len;
    ret = [];
    for (_i = 0, _len = str.length; _i < _len; _i++) {
      i = str[_i];
      if (i === ' ') {
        ret.push('+');
        continue;
      }
      code = i.charCodeAt(0);
      if (code >> 7) {
        gbkcode = this.gbk[code];
        ret.push('%');
        ret.push((gbkcode >> 8).toString(16).toUpperCase());
        ret.push('%');
        ret.push((gbkcode & 0xFF).toString(16).toUpperCase());
      } else {
        ret.push(String.fromCharCode(code));
      }
    }
    return ret.join('');
  },
  toEncoding: function(str, encoding) {
    if (encoding === 'big5') {
      return this.toBig5(str);
    }
    return this.toGbk(str);
  }
};