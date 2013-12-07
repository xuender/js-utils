###
Encoding Utils
###
if not this.JU
  this.JU = {}

JU.toBig5 = (str)->
  ### UTF8 -> BIG5 ###
  ret = []
  for i in str
    if i == ' '
      ret.push('+')
      continue
    code = i.charCodeAt(0)
    if code >> 7
      big5code = JU._big5[code]
      ret.push('%')
      ret.push((big5code >> 8).toString(16).toUpperCase()) #high byte
      ret.push(String.fromCharCode(big5code & 0xFF))
    else
      ret.push(String.fromCharCode(code))
  ret.join('')

JU.toGbk = (str)->
  ### UTF8 -> GBK ###
  ret = []
  for i in str
    if i == ' '
      ret.push('+')
      continue
    code = i.charCodeAt(0)
    if code >> 7
      gbkcode = JU._gbk[code]
      ret.push('%')
      ret.push((gbkcode >> 8).toString(16).toUpperCase()) #high byte
      ret.push('%')
      ret.push((gbkcode & 0xFF).toString(16).toUpperCase()) #low byte
    else
      ret.push(String.fromCharCode(code))
  ret.join('')

JU.toEncoding = (str, encoding = 'GBK')->
  ### UTF8 -> GBK or BIG5 ###
  if encoding == 'big5'
    return JU.toBig5(str)
  JU.toGbk(str)
