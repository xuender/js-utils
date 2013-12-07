describe('iconv', ->
  it('toEncoding', ->
    expect(JU.toEncoding('中国', 'gbk')).toEqual('%D6%D0%B9%FA')
    expect(JU.toEncoding('中国1', 'gbk')).toEqual('%D6%D0%B9%FA1')
    expect(JU.toEncoding('中国a', 'gbk')).toEqual('%D6%D0%B9%FAa')
    expect(JU.toEncoding('中国 a', 'gbk')).toEqual('%D6%D0%B9%FA+a')
    expect(JU.toEncoding('你好', 'big5')).toEqual('%A7A%A6n')
  )
)
