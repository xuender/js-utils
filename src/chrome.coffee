###
chrome utils
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
JU = JU || {}
JU.syncFetch = (file, fn)->
  ### 获取资源文件 ###
  xhr = new XMLHttpRequest()
  xhr.open("GET", chrome.extension.getURL(file), false)
  xhr.onreadystatechange = ->
    if this.readyState == 4 and this.responseText
      fn(this.responseText)
  try
    xhr.send()

class JU.I18n
  ### I18N ###
  constructor: (@locale) ->
    file = "/_locales/#{@locale}/messages.json"
    JU.syncFetch(file, (text)=>
      @l10nData = JSON.parse(text)
    )
  getMessage: (id, args='')->
    if @l10nData && id of @l10nData
      msgData = @l10nData[id]
      if msgData.message
        return msgData.message.replace(/\$\$/g, '$')
    args
# I18N
class JU.I18n2
  constructor: (@dict) ->
  getMessage: (key, def=key)->
    if key of @dict
      return @dict[key]
    def
