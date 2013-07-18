describe('re', ->
  it('isUrl', ->
    expect(isUrl('www.baidu.com')).toEqual(true)
    expect(isUrl('baidu.com')).toEqual(true)
    expect(isUrl('baidu.cn')).toEqual(true)
    expect(isUrl('baidu.c')).toEqual(false)
    expect(isUrl('你好')).toEqual(false)
  )
  it('isProtocol', ->
    expect(isProtocol('www.baidu.com')).toEqual(false)
    expect(isProtocol('http://www.baidu.com')).toEqual(true)
  )
)
