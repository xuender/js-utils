###
# utils 常用工具方法
###
getId = (id = 'ID')->
  ### 获取不重复的顺序ID ###
  if window[id] == undefined
    window[id] = 1
  window[id]++
isArray = (array) ->
  ### 判断对象是否是数组 ###
  Object.prototype.toString.call(array) == '[object Array]'
findArray = (collection, attribute, value)->
  ### 数组对象查找 ###
  if isArray(value)
    ret = []
    for o in value
      ret.push(findArray(collection, attribute, o))
    return ret
  for c in collection
    if c[attribute] == value
      return c
  null
updateArray = (collection, o, n)->
  ### 数组替换 ###
  collection[index] = n for index, value of collection when value == o
  collection
arrayRemove = (collection, obj)->
  ### 删除对象 ###
  collection.splice(index, 1) for index, value of collection when value == obj
sortOn = (collection, name)->
  ### 根据数组中对象某属性进行排序 ###
  if name[0] == '-'
    desc = true
    name = name[1..]
  collection.sort((a, b)->
    if a[name] <= b[name]
      return -1
    1
  )
  if desc
    return collection.reverse()
groupBy = (items, attribute)->
  ### 获取对象分组 ###
  ret = []
  sortOn(items, attribute)
  groupValue = '_INVALID_GROUP_VALUE_'
  for i in items
    if i[ attribute ] != groupValue
      group =
        label: i[ attribute ]
        items: []
      groupValue = group.label
      ret.push(group)
    group.items.push(i)
  ret
localStorageGet = (key, defaultValue = false)->
  ### 读取本地数据 ###
  value = localStorage.getItem(key)
  if value then return JSON.parse(value)
  defaultValue
localStorageSet = (key, value)->
  ### 设置本地数据 ###
  localStorage.setItem(key, JSON.stringify(value))
