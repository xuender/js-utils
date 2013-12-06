###
chrome utils
###
syncFetch = (file, fn)->
  ### 获取资源文件 ###
  xhr = new XMLHttpRequest()
  xhr.open("GET", chrome.extension.getURL(file), false)
  xhr.onreadystatechange = ->
    if this.readyState == 4 and this.responseText != ""
      fn(this.responseText)
  try
    xhr.send()

class I18n
  ### I18N ###
  constructor: (@locale) ->
    file = "/_locales/#{@locale}/messages.json"
    syncFetch(file, (text)=>
      @l10nData = JSON.parse(text)
    )
  parseString = (msgData, args)->
    if msgData.message
      return msgData.message.replace(/\$\$/g, '$')
    args
  getMessage: (id, args='')->
    if @l10nData && id of @l10nData
      return parseString(@l10nData[id], args)
    ''
