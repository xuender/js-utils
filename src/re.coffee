re=null
isUrl = (str)->
  ### 判断字符串是否是URL ###
  #strRegex = '^((https|http|ftp|rtsp|mms)?://)(^[a-zA-Z0-9])?.[a-zA-Z0-9-]+.[a-zA-Z]{2,6}+$'
  #strRegex = '^((https|http|ftp|rtsp|mms)?://)' +
  #  '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' +#ftp的user@
  #  '(([0-9]{1,3}.){3}[0-9]{1,3}' +# IP形式的URL- 199.194.52.184
  #  '|' +# 允许IP和DOMAIN（域名）
  #  '([0-9a-z_!~*\'()-]+.)+' +# 域名- www.
  #  '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' +# 二级域名
  #  '[a-z]{2,6})' +# first level domain- .com or .museum
  #  '(:[0-9]{1,4})?' +# 端口- :80
  #  '((/?)|' +# a slash isn't required if there is no file name
  #  '(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?)$'
  #re=new RegExp(strRegex)
  #re = /(((ht|f)tps?\:\/\/)?([a-zA-Z]{1}([\w\-]+\.)+([\w]{2,5})(:[\d]{1,5})?))\S+/i
  #re = /^(?!:\/\/)([a-zA-Z0-9]+\.)?[a-zA-Z0-9][a-zA-Z0-9-]+\.[a-zA-Z]{2,6}?$/i
  re = /^((ht|f)tps?\:\/\/)?([a-z0-9]+\.)?[a-z0-9][a-z0-9-]*\.[a-z]{2,6}$/i
  re.test(str)

isProtocol = (str)->
  ### 判断是否包含协议 ###
  strRegex = '^((https|http|ftp|rtsp|mms)?://)'
  re=new RegExp(strRegex)
  re.test(str)
