###
ic.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

#JU = JU || {}
#JU.random = (max, min = 0)->
#  r = max - min
#  min + Math.round(Math.random() * r)
(
  key = 'ABCDEFGHIJKMPSTUWXYZ'
  map = {
    L: 'I'
    V: 'U'
    Q: 'D'
    R: 'P'
    O: 'D'
    N: 'M'
  }
  toArray = (i, array)->
    array.push(i % 20)
    i = parseInt(i / 20)
    if i > 20
      toArray(i, array)
    else if i > 0
      array.push i
  find = (s)->
    i = key.indexOf(s)
    if i < 0 then i = 0
    i
  # ID转换识别码
  # id 数值
  # len 识别码长度
  JU.int2ic = (id, len = 5)->
    cs = []
    toArray(id, cs)
    cs.unshift(cs.length)
    if cs.length < len
      for i in [cs.length...len]
        cs.push(JU.random(19))
    ret = []
    for i in cs.reverse()
      ret.push key[i]
    ret.join('')
  update = (ic)->
    ret = []
    for i in ic.toUpperCase()
      if i of map
        ret.push map[i]
      else
        ret.push i
    ret.join('')
  # 获取识别码无意义部分
  JU.icCode = (ic)->
    ic = update ic
    l = ic.length - 1
    n = find(ic[l])
    ic[0...l-n]
  # 识别码转换成ID
  # ic 识别码
  JU.ic2int = (ic)->
    ic = update ic
    l = ic.length - 1
    n = find(ic[l])
    m = 0
    ret = 0
    for i in [l-1..l-n]
      ret+=(20**m)*find(ic[i])
      m++
    ret

  JU.uid = ->
    now = (new Date()).getTime() - 1448785120450
    JU.int2ic(JU.random(99999,10000)) + '-' + JU.int2ic(now)
)
#for i in [0...100]
#  a = JU.int2ic(i)
#  console.log a, JU.icCode(a)
#for i in [0...100]
#  console.log JU.uid()
#console.log JU.int2ic(144)
#console.log JU.int2ic(1448785120450)
#for i in [0...1000]
#  console.log JU.int2ic(i), JU.ic2int(JU.int2ic(i))
