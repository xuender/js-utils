// Generated by CoffeeScript 1.6.3
var iconv;

iconv = {
  toEncoding: function(str, encoding) {
    var code, gbkcode, i, ret, revCharsTable, _i, _len;
    if (encoding === 'big5') {
      revCharsTable = this.big5;
    } else {
      revCharsTable = this.gbk;
    }
    ret = [];
    for (_i = 0, _len = str.length; _i < _len; _i++) {
      i = str[_i];
      if (i === ' ') {
        ret.push('+');
        continue;
      }
      code = i.charCodeAt(0);
      if (code >> 7) {
        gbkcode = revCharsTable[code];
        ret.push('%');
        ret.push((gbkcode >> 8).toString(16).toUpperCase());
        ret.push('%');
        ret.push((gbkcode & 0xFF).toString(16).toUpperCase());
      } else {
        ret.push(code);
      }
    }
    return ret.join('');
  }
};
