###
chromeMocks.coffee
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
chrome =
  extension:
    getURL: (file)->
      ### read url ###
      file
class XMLHttpRequest
  ###
  XMLHttpRequest mock

  XMLHttpRequest.response = 'ok'
  ####
  open: (mode, url, async)->
    @url = url
    true
  send: ->
    @readyState = 4
    @responseText = XMLHttpRequest.response
    this.onreadystatechange()
