###
set.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

class JU.Set
  constructor: (@getId=null, arr=null)->
    @values = []
    @data = []
    if arr
      this.addArr(arr)

  # 增加
  add: (arg)=>
    arr = JU.Set.getArrS arg, @getId
    isNew = false
    for t, i in arr
      if @values[i]
        if (not isNew) and @values[i] != @values[i] | t then isNew = true
        @values[i] = @values[i] | t
      else
        @values[i] = t
        if t > 0 then isNew = true
    if isNew and (arg not instanceof JU.Set) then @data.push(arg)

  # 增加数组
  addArr: (arr)->
    for a in arr
      this.add(a)

  # 删除
  remove: (arg)=>
    arr = JU.Set.getArrS arg, @getId
    isOld = false
    for t, i in arr
      if @values[i]
        if @values[i] & t
          if (not isOld) and @values[i] != @values[i] ^ t then isOld = true
          @values[i] = @values[i] ^ t
    if isOld and (arg not instanceof JU.Set)
      JU.remove(@data, (obj)=>
        if @getId
          ret = @getId(obj) == @getId(arg)
        else
          ret = obj == arg
        ret
      )

  # 删除数组
  removeArr: (arr)->
    for a in arr
      this.remove(a)

  # 是否包含
  in: (arg)=>
    arr = JU.Set.getArrS arg, @getId
    for s, i in arr
      if s
        t = s & @values[i]
        if t != s
          return false
    true

  # 是否包含一个
  inOne: (arg)->
    arr = JU.Set.getArrS arg, @getId
    for s, i in arr
      if s
        t = s & @values[i]
        if t
          return true
    false

  # 交集
  intersection: (arg)->
    arr = JU.Set.getArr arg
    v = []
    for t, i in @values
      if arr[i]
        v[i] = arr[i] & t
    ret = new JU.Set(@getId)
    ret.values= v
    for i in @data
      if ret.in i
        ret.add i
    ret

  # 比较
  equal: (arg)->
    arr = JU.Set.getArr arg
    for t, i in this.values
      if t and arr[i]
        if arr[i] != t
          return false
      else if t or arr[i]
        return false
    true

  # 创建values
  @create: (arg, getId)=>
    arr = []
    if getId
      if arg instanceof Array
        for i in arg
          arr.push(getId(i))
      else
        arr = [getId(arg)]
    else
      if arg instanceof Array
        arr = arg
      else
        arr = [arg]
    ret = []
    for i in arr
      if i >= 0
        x = Math.floor(i/32)
        y = 1 << (i%32)
        if ret[x]
          ret[x] = ret[x] | y
        else
          ret[x] = y
      else
        throw new Error("error: #{i}")
    ret

  @getArr: (arg)->
    if arg instanceof JU.Set
      arr = arg.values
    else
      arr = arg
    arr

  @getArrS: (arg, getId)->
    if arg instanceof JU.Set
      arr = arg.values
    else
      arr = JU.Set.create(arg, getId)
    arr
