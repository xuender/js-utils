describe('iconv', ->
  it('toEncoding', ->
    expect(iconv.toEncoding('中国', 'gbk')).toEqual('%D6%D0%B9%FA')
  )
)
