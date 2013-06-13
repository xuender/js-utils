syncFetch = (file, fn)->
  ### 获取资源文件 ###
  xhr = new XMLHttpRequest()
  xhr.open("GET", chrome.extension.getURL(file), false)
  xhr.onreadystatechange = ->
    if this.readyState == 4 and this.responseText != ""
      fn(this.responseText)
  try
    xhr.send()
