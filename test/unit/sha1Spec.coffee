describe('sha1', ->
  it('hex_sha1', ->
    expect(hex_sha1('www.baidu.com')).toEqual('31e50a13cdfa1bc2a6a0c2a31b74e3340b7a2dbc')
  )
)
