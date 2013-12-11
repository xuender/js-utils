###
Regex utls
###
JU = JU || {}

JU.isUrl = (str)->
  ### 判断字符串是否是URL ###
  re = /^((ht|f)tps?\:\/\/)?([a-z0-9]+\.)?[a-z0-9][a-z0-9-]*\.[a-z]{2,6}$/i
  re.test(str)

JU.hasProtocol = (str)->
  ### 判断是否包含协议 ###
  strRegex = '^((https|http|ftp|rtsp|mms)?://)'
  re = new RegExp(strRegex)
  re.test(str)
