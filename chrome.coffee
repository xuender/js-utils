syncFetch = (file, fn)->
  ### 获取资源文件 ###
  xhr = new XMLHttpRequest()
  xhr.open("GET", chrome.extension.getURL(file), false)
  xhr.onreadystatechange = ->
    if this.readyState == 4 and this.responseText != ""
      fn(this.responseText)
  try
    xhr.send()
chrome.i18n =(->
  parseString = (msgData, args)->
    if msgData.placeholders == undefined and args == undefined
      return msgData.message.replace(/\$\$/g, '$')

    safesub = (txt, re, replacement)->
      dollaRegex = /\$\$/g
      dollaSub = "~~~I18N~~:"
      txt = txt.replace(dollaRegex, dollaSub)
      txt = txt.replace(re, replacement)
      undollaRegex = /~~~I18N~~:/g
      undollaSub = "$$$$"
      txt.replace(undollaRegex, undollaSub)

    $n_re = /\$([1-9])/g
    $n_subber = (_, num)->
      args[num - 1]

    placeholders = {}
    for name in msgData.placeholders
      content = msgData.placeholders[name].content
      placeholders[name.toLowerCase()] = safesub(content, $n_re, $n_subber)

    message = safesub(msgData.message, $n_re, $n_subber)
    message = safesub(message, /\$(\w+?)\$/g, (full, name)->
      lowered = name.toLowerCase()
      if lowered in placeholders
        return placeholders[lowered]
      full
    )
    message.replace(/\$\$/g, '$')

    l10nData = undefined

    {
      _getL10nData: ->
        result = { locales: [] }

        result.locales.push(navigator.language.replace('-', '_'))
        if navigator.language.length > 2
          result.locales.push(navigator.language.substring(0, 2))
        if result.locales.indexOf("en") == -1
          result.locales.push("en")

        result.messages = {}
        for locale in result.locales
          file = "_locales/" + locale + "/messages.json"
          syncFetch(file, (text)->
            result.messages[locale] = JSON.parse(text)
          )
        result

      _setL10nData: (data)->
        l10nData = data

      getMessage: (messageID, args)->
        if l10nData == undefined
          chrome.i18n._setL10nData(chrome.i18n._getL10nData())
        if typeof args == "string"
          args = [args]
        for locale in l10nData.locales
          map = l10nData.messages[locale]
          if map && messageID in map
            return parseString(map[messageID], args)
        ""
    }
  )()
