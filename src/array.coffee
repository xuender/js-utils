###
# array utls
###
if not this.JU
  this.JU = {}

JU.getId = (id = 'ID')->
  ### 获取不重复的顺序ID ###
  if window[id] == undefined
    window[id] = 1
  window[id]++

JU.findArray = (collection, attribute, value)->
  ### 数组对象查找 ###
  if Array.isArray(value)
    ret = []
    for o in value
      ret.push(JU.findArray(collection, attribute, o))
    return ret
  for c in collection
    if c[attribute] == value
      return c
  null

JU.updateArray = (collection, o, n)->
  ### 数组替换 ###
  collection[index] = n for index, value of collection when value == o
  collection

JU.arrayRemove = (collection, obj)->
  ### 删除对象 ###
  collection.splice(index, 1) for index, value of collection when value == obj

JU.sortOn = (collection, name)->
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

JU.groupBy = (items, attribute)->
  ### 获取对象分组 ###
  ret = []
  JU.sortOn(items, attribute)
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
