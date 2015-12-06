###
math.coffee
Copyright (C) 2015 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

# 随机数
# max 最大值
# min 最小值
JU.random = (max, min = 0)->
  r = max - min
  min + Math.round(Math.random() * r)

