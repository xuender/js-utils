###
HTML5 utils
###
if not this.JU
  this.JU = {}

JU.localStorageGet = (key, defaultValue = false)->
  ### 读取本地数据 ###
  value = localStorage.getItem(key)
  if value then return JSON.parse(value)
  defaultValue

JU.localStorageSet = (key, value)->
  ### 设置本地数据 ###
  localStorage.setItem(key, JSON.stringify(value))
