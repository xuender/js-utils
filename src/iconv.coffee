###
iconv Utils
###
JU = JU || {}

JU.str2hex = (str, split='', prefix='')->
  ### string to Hex ###
  ret = []
  for i in str
    ret.push(prefix + i.charCodeAt(0).toString(16))
  ret.join(split)

JU.toGbk = (str)->
  ### UTF-8 -> GBK ###
  ret = []
  gbk = JU._getGbk()
  for i in str
    code = i.charCodeAt(0)
    if code >> 7
      gbkcode = gbk[code]
      ret.push(String.fromCharCode(gbkcode >> 8)) #high byte
      ret.push(String.fromCharCode(gbkcode & 0xFF)) #low byte
    else
      ret.push(code)
  ret.join('')

JU.toBig5 = (str)->
  ### UTF-8 -> BIG5 ###
  ret = []
  big5 = JU._getBig5()
  for i in str
    code = i.charCodeAt(0)
    if code >> 7
      big5code = big5[code]
      ret.push(String.fromCharCode(big5code >> 8)) #high byte
      ret.push(String.fromCharCode(big5code & 0xFF))
    else
      ret.push(code)
  ret.join('')

JU.gbkEncodeURI = (str)->
  ### GBK encode to URI ###
  ret = []
  gbk = JU._getGbk()
  for i in str
    if i == ' '
      ret.push('+')
      continue
    code = i.charCodeAt(0)
    if code >> 7
      gbkcode = gbk[code]
      ret.push('%')
      ret.push((gbkcode >> 8).toString(16).toUpperCase()) #high byte
      ret.push('%')
      ret.push((gbkcode & 0xFF).toString(16).toUpperCase()) #low byte
    else
      ret.push(String.fromCharCode(code))
  ret.join('')

JU.big5EncodeURI = (str)->
  ### BIG5 encode to URI ###
  ret = []
  big5 = JU._getBig5()
  for i in str
    if i == ' '
      ret.push('+')
      continue
    code = i.charCodeAt(0)
    if code >> 7
      big5code = big5[code]
      ret.push('%')
      ret.push((big5code >> 8).toString(16).toUpperCase()) #high byte
      ret.push(String.fromCharCode(big5code & 0xFF))
    else
      ret.push(String.fromCharCode(code))
  ret.join('')

JU.encodeURI= (str, encoding = '')->
  ### GBK or BIG5 encode URI ###
  if encoding[..2].toUpperCase() == 'GBK'
    return JU.gbkEncodeURI(str)
  if encoding[..2].toUpperCase() == 'BIG'
    return JU.big5EncodeURI(str)
  encodeURI(str)
