describe 'array', ->
  it 'getId', ->
    expect(JU.getId()).toEqual(1)
    expect(JU.getId()).toEqual(2)
    expect(JU.getId()).toEqual(3)

describe 'findArray', ->
  it '对象查找', ->
    c = [
      {a: 1, b: 10}
      {a: 2, b: 20}
      {a: 3, b: 30}
    ]
    expect(JU.findArray(c, 'a', 2).b).toEqual(20)
    expect(JU.findArray(c, 'a', [2, 3]).length).toEqual(2)

describe 'updateArray', ->
  it '数组替换', ->
    a = [1, 2, 3]
    expect(JU.updateArray(a, 2, 9)).toEqual([1, 9, 3])
    a = [1, 2, 2]
    expect(JU.updateArray(a, 2, 9)).toEqual([1, 9, 9])
    expect(JU.updateArray(a, 2, 9)).toEqual(a)

describe 'removeArray', ->
  it '数组对象删除', ->
    a = ['a', 'b', 'c']
    JU.removeArray(a, 'b')
    expect(a).toEqual(['a', 'c'])

describe 'sortOn', ->
  c = [
    {a: 1, b: 4}
    {a: 2, b: 3}
    {a: 3, b: 2}
    {a: 4, b: 1}
  ]
  it 'a顺序', ->
    JU.sortOn(c, 'a')
    expect(c[0].a).toEqual(1)
    expect(c[1].a).toEqual(2)
  it 'b顺序', ->
    JU.sortOn(c, 'b')
    expect(c[0].a).toEqual(4)
    expect(c[1].a).toEqual(3)
  it 'a倒序', ->
    JU.sortOn(c, '-a')
    expect(c[0].a).toEqual(4)
    expect(c[1].a).toEqual(3)
  it 'b倒序', ->
    JU.sortOn(c, '-b')
    expect(c[0].a).toEqual(1)
    expect(c[1].a).toEqual(2)

describe 'groupBy', ->
  c = [
    {a: 1, t: 1, g: 3}
    {a: 2, t: 1, g: 4}
    {a: 3, t: 2, g: 3}
    {a: 4, t: 2, g: 4}
  ]
  it 't分组', ->
    g = JU.groupBy(c, 't')
    JU.sortOn(g[0].items, 'a')
    JU.sortOn(g[1].items, 'a')
    expect(g[0].label).toEqual(1)
    expect(g[1].label).toEqual(2)
    expect(g[0].items[0].a).toEqual(1)
    expect(g[0].items[1].a).toEqual(2)
    expect(g[1].items[0].a).toEqual(3)
    expect(g[1].items[1].a).toEqual(4)
  it 'g分组', ->
    g = JU.groupBy(c, 'g')
    JU.sortOn(g[0].items, 'a')
    JU.sortOn(g[1].items, 'a')
    expect(g[0].label).toBe(3)
    expect(g[1].label).toBe(4)
    expect(g[0].items[0].a).toBe(1)
    expect(g[0].items[1].a).toBe(3)
    expect(g[1].items[0].a).toBe(2)
    expect(g[1].items[1].a).toBe(4)

describe 'random', ->
  it '数据完整', ->
    b = ['a', 'b', 'c', 'd']
    for i in [1..10]
      a = ['a', 'b', 'c', 'd']
      JU.random(a)
      for c in a
        expect(c in b).toBe(true)
  it '乱序', ->
    count = 0
    for i in [1..10]
      a = ['a', 'b', 'c', 'd']
      JU.random(a)
      if a[0] != 'a'
        count += 1
    expect(count).toBeGreaterThan(5)
