###
array.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

JU.find = (array, cb)->
  if array not instanceof Array
    return array
  for a in array
    if cb(a)
      return a
  null

JU.remove = (array, cb)->
  if array not instanceof Array
    return array
  s = []
  for a, i in array
    if cb(a)
      s.push i
  for i in s.reverse()
    array.splice(i, 1)
  array

