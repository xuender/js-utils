###
HTML5 utils
###
JU = JU || {}

JU.lsGet = (key, defaultValue = false)->
  ### 读取本地数据 ###
  value = localStorage.getItem(key)
  if value then return JSON.parse(value)
  defaultValue

JU.lsSet = (key, value)->
  ### 设置本地数据 ###
  localStorage.setItem(key, JSON.stringify(value))
