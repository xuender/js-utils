###
array.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

JU.find = (array, cb)->
  for a in array
    if cb(a)
      return a
  null

JU.remove = (array, cb)->
  s = []
  for a, i in array
    if cb(a)
      s.push i
  for i in s.reverse()
    array.splice(i, 1)
  array

