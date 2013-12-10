describe 'localStorage Get', ->
  it '取值', ->
    localStorage['a'] = '2'
    expect(JU.lsGet('a')).toEqual(2)
    expect(JU.lsGet('b', '3')).toEqual('3')

describe 'localStorage Set', ->
  it '设值', ->
    JU.lsSet('c', '5')
    expect(localStorage['c']).toEqual('"5"')

describe 'boolen', ->
  it '设值', ->
    JU.lsSet('c', true)
    expect(JU.lsGet('c')).toEqual(true)
    JU.lsSet('c', false)
    expect(JU.lsGet('c')).toEqual(false)
