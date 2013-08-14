describe('re', ->
  it('isUrl', ->
    expect(isUrl('baidu')).toEqual(false)
    expect(isUrl('http://baidu')).toEqual(false)
    expect(isUrl('http://baidu.cn')).toEqual(true)
    expect(isUrl('www.baidu.com')).toEqual(true)
    expect(isUrl('baidu.com')).toEqual(true)
    expect(isUrl('baidu.cn')).toEqual(true)
    expect(isUrl('baidu.c')).toEqual(false)
    expect(isUrl('你好')).toEqual(false)
    expect(isUrl('booking')).toEqual(false)
  )
  it('isProtocol', ->
    expect(isProtocol('www.baidu.com')).toEqual(false)
    expect(isProtocol('http://www.baidu.com')).toEqual(true)
  )
)
