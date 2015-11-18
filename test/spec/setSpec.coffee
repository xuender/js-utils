###
setSpec.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

describe 'set', ->
  it 'add', ->
    s = new JU.Set()
    expect(s.values.length).toEqual(0)
    s.add 7
    expect(s.values.length).toEqual(1)
    s.add 28
    expect(s.values.length).toEqual(1)
    s.add 58
    expect(s.values.length).toEqual(2)
  it 'addArr', ->
    s = new JU.Set(null, [7, 28, 58])
    expect(s.values.length).toEqual(2)
    expect(s.values[0]).toEqual(268435584)
  it 'remove', ->
    s = new JU.Set(null, [7, 28, 58])
    s.remove 58
    expect(s.values.length).toEqual(2)
    expect(s.values[1]).toEqual(0)
  describe 'func', ->
    s = new JU.Set(null, [7, 28, 58])
    it 'in', ->
      expect(s.in(7)).toEqual(true)
      expect(s.in([7, 28])).toEqual(true)
      expect(s.in([7, 18])).toEqual(false)
      expect(s.in(28)).toEqual(true)
      expect(s.in(58)).toEqual(true)
      expect(s.in(17)).toEqual(false)
      expect(s.in(37)).toEqual(false)
      expect(s.in(87)).toEqual(false)
      expect(s.in([6, 7])).toEqual(false)
      expect(s.in([28, 58, 7])).toEqual(true)
      expect(s.in([58, 7])).toEqual(true)
    it 'inOne', ->
      expect(s.inOne([6, 7])).toEqual(true)
      expect(s.inOne([6, 17])).toEqual(false)
      expect(s.inOne([28, 58, 7])).toEqual(true)
    it 'equal', ->
      s1 = new JU.Set(null, [7, 28, 58])
      s2 = new JU.Set(null, [7, 88, 58])
      expect(s.equal(s1)).toEqual(true)
      expect(s.equal(s2)).toEqual(false)
  describe 'set func', ->
    s1 = new JU.Set(null, [1, 2, 3])
    s2 = new JU.Set(null, [2, 3, 4])
    it 'intersection', ->
      s = s1.intersection(s2)
      expect(s.values).toEqual([12])

describe 'set obj', ->
  getId = (obj)->
    obj.i
  it 'add', ->
    s = new JU.Set(getId)
    expect(s.values.length).toEqual(0)
    expect(s.data.length).toEqual(0)
    s.add({i:7})
    expect(s.values.length).toEqual(1)
    expect(s.data.length).toEqual(1)
    s.add {i:28}
    expect(s.values.length).toEqual(1)
    expect(s.data.length).toEqual(2)
    s.add {i:58}
    expect(s.values.length).toEqual(2)
    expect(s.data.length).toEqual(3)
  it 'addArr', ->
    s = new JU.Set(getId, [{i:7}, {i:28}, {i:58}])
    expect(s.values.length).toEqual(2)
    expect(s.values[0]).toEqual(268435584)
    expect(s.data.length).toEqual(3)
  it 'remove', ->
    s = new JU.Set(getId, [{i:7}, {i:28}, {i:58}])
    s.remove {i:58}
    expect(s.values.length).toEqual(2)
    expect(s.data.length).toEqual(2)
    expect(s.values[1]).toEqual(0)
  describe 'func', ->
    s = new JU.Set(getId, [{i:7}, {i:28}, {i:58}])
    it 'in', ->
      expect(s.in({i:7})).toEqual(true)
      expect(s.in([{i:7}, {i:28}])).toEqual(true)
      expect(s.in([{i:7}, {i:18}])).toEqual(false)
      expect(s.in({i:28})).toEqual(true)
      expect(s.in({i:58})).toEqual(true)
      expect(s.in({i:17})).toEqual(false)
      expect(s.in({i:37})).toEqual(false)
      expect(s.in({i:87})).toEqual(false)
      expect(s.in([{i:6}, {i:7}])).toEqual(false)
      expect(s.in([{i:28}, {i:58}, {i:7}])).toEqual(true)
      expect(s.in([{i:58}, {i:7}])).toEqual(true)
    it 'inOne', ->
      expect(s.inOne([{i:6}, {i:7}])).toEqual(true)
      expect(s.inOne([{i:6}, {i:17}])).toEqual(false)
      expect(s.inOne([{i:28}, {i:58}, {i:7}])).toEqual(true)
    it 'equal', ->
      s1 = new JU.Set(getId, [{i:7}, {i:28}, {i:58}])
      s2 = new JU.Set(getId, [{i:7}, {i:88}, {i:58}])
      expect(s.equal(s1)).toEqual(true)
      expect(s.equal(s2)).toEqual(false)
  describe 'set func', ->
    s1 = new JU.Set(getId, [{i:1}, {i:2}, {i:3}])
    s2 = new JU.Set(getId, [{i:4}, {i:2}, {i:3}])
    it 'intersection', ->
      s = s1.intersection(s2)
      expect(s.values).toEqual([12])
      expect(s.data.length).toEqual(2)

