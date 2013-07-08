iconv =
  toEncoding:(str, encoding)->
    if encoding == 'big5'
      revCharsTable = this.big5
    else
      revCharsTable = this.gbk
    ret = []
    for i in str
      if i == ' '
        ret.push('+')
        continue
      code = i.charCodeAt(0)
      if code >> 7
        gbkcode = revCharsTable[code]
        ret.push('%')
        ret.push((gbkcode >> 8).toString(16).toUpperCase()) #high byte
        ret.push('%')
        ret.push((gbkcode & 0xFF).toString(16).toUpperCase()) #low byte
      else
        ret.push(code)
    ret.join('')
