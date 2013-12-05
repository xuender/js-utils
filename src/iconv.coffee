iconv =
  toBig5:(str)->
    ret = []
    for i in str
      if i == ' '
        ret.push('+')
        continue
      code = i.charCodeAt(0)
      if code >> 7
        gbkcode = this.big5[code]
        ret.push('%')
        ret.push((gbkcode >> 8).toString(16).toUpperCase()) #high byte
        ret.push(String.fromCharCode(gbkcode & 0xFF))
      else
        ret.push(String.fromCharCode(code))
    ret.join('')
  toGbk:(str)->
    ret = []
    for i in str
      if i == ' '
        ret.push('+')
        continue
      code = i.charCodeAt(0)
      if code >> 7
        gbkcode = this.gbk[code]
        ret.push('%')
        ret.push((gbkcode >> 8).toString(16).toUpperCase()) #high byte
        ret.push('%')
        ret.push((gbkcode & 0xFF).toString(16).toUpperCase()) #low byte
      else
        ret.push(String.fromCharCode(code))
    ret.join('')
  toEncoding:(str, encoding)->
    if encoding == 'big5'
      return this.toBig5(str)
    this.toGbk(str)
