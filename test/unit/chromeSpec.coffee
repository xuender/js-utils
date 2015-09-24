###
chromeSpec.coffee
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
describe 'syncFetch', ->
  it '取值', ->
    callBack = (txt)->
      expect(txt).toEqual('ok')
    XMLHttpRequest.response = 'ok'
    JU.syncFetch('url', callBack)
describe 'I18n', ->
  XMLHttpRequest.response = '{"key":{"message":"ok"}}'
  i18n = new JU.I18n('zh_CN')
  it 'getMessage', ->
    expect(i18n.getMessage('key')).toEqual('ok')
describe 'I18n2', ->
  i18n = new JU.I18n2({'key':'value'})
  it 'getMessage', ->
    expect(i18n.getMessage('key')).toEqual('value')
    expect(i18n.getMessage('key2')).toEqual('key2')
    expect(i18n.getMessage('key3', 'value3')).toEqual('value3')
