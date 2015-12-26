###
arraySpec.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

describe 'array', ->
  it 'find', ->
    as=[
      {id:1, name:1}
      {id:2, name:2}
      {id:3, name:3}
    ]
    a = JU.find(as, (i)->
      i.id == 2
    )
    expect(a.name).toEqual(2)
  it 'find err', ->
    a = JU.find('aaa', (i)->
      i.id == 2
    )
    expect(a).toEqual('aaa')
  it 'remove', ->
    as=[
      {id:1, name:1}
      {id:2, name:2}
      {id:3, name:3}
    ]
    JU.remove(as, (i)->
      i.id == 2
    )
    expect(as.length).toEqual(2)
    expect(as[0].name).toEqual(1)
    expect(as[1].name).toEqual(3)
  it 'remove err', ->
    a = JU.remove('aaa', (i)->
      i.id == 2
    )
    expect(a).toEqual('aaa')
  it 'query array', ->
    as = [
      {id:1, name:1}
      {id:2, name:2}
      {id:3, name:3}
    ]
    q = JU.query(as, (i)->
      i.id < 3
    )
    expect(q.length).toEqual(2)
  it 'query map', ->
    map = {id:3, name:3, f: 4}
    q = JU.query(map, (k, v)->
      v == 3
    )
    expect(q.length).toEqual(2)
