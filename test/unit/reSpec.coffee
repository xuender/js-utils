describe('re', ->
  it('isUrl', ->
    expect(JU.isUrl('baidu')).toEqual(false)
    expect(JU.isUrl('http://baidu')).toEqual(false)
    expect(JU.isUrl('http://baidu.cn')).toEqual(true)
    expect(JU.isUrl('www.baidu.com')).toEqual(true)
    expect(JU.isUrl('baidu.com')).toEqual(true)
    expect(JU.isUrl('baidu.cn')).toEqual(true)
    expect(JU.isUrl('baidu.c')).toEqual(false)
    expect(JU.isUrl('你好')).toEqual(false)
    expect(JU.isUrl('booking')).toEqual(false)
  )
  it('hasProtocol', ->
    expect(JU.hasProtocol('www.baidu.com')).toEqual(false)
    expect(JU.hasProtocol('http://www.baidu.com')).toEqual(true)
  )
)
