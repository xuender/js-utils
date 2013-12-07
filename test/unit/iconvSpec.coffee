describe('iconv', ->
  it 'str2hex', ->
    expect(JU.str2hex('ab')).toEqual('6162')
    expect(JU.str2hex('阿弥陀佛', '', '\\u')).toEqual('\\u963f\\u5f25\\u9640\\u4f5b')

  it 'encodeURI', ->
    expect(JU.encodeURI('阿弥陀佛', 'gbk')).toEqual('%B0%A2%C3%D6%CD%D3%B7%F0')
    expect(JU.encodeURI('阿弥陀佛1', 'gbk')).toEqual('%B0%A2%C3%D6%CD%D3%B7%F01')
    expect(JU.encodeURI('阿弥陀佛 a', 'gbk')).toEqual('%B0%A2%C3%D6%CD%D3%B7%F0+a')
    expect(JU.encodeURI('阿弥陀佛', 'big5')).toEqual('%AAü%93ù%AAû%A6ò')

  it 'toGbk', ->
    expect(JU.str2hex(JU.toGbk('郎'))).toEqual('fd9c')

  it 'toBig5', ->
    expect(JU.str2hex(JU.toBig5('嗀嗀'))).toEqual('dcd1ddfc')
)
