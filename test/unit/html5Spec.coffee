describe 'localStorageGet', ->
  it '取值', ->
    localStorage['a'] = '2'
    expect(JU.localStorageGet('a')).toEqual(2)
    expect(JU.localStorageGet('b', '3')).toEqual('3')

describe 'localStorageSet', ->
  it '设值', ->
    JU.localStorageSet('c', '5')
    expect(localStorage['c']).toEqual('"5"')

describe 'boolen', ->
  it '设值', ->
    JU.localStorageSet('c', true)
    expect(JU.localStorageGet('c')).toEqual(true)
    JU.localStorageSet('c', false)
    expect(JU.localStorageGet('c')).toEqual(false)
