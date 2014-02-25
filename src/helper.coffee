###
helper.coffee
Copyright (C) 2014 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###

JU.queue = (funcs, scope)->
  ### 异步顺序执行队列 ###
  (next = ->
    if funcs.length > 0
      funcs.shift().apply(scope || {}, [next].concat(Array.prototype.slice.call(arguments, 0)))
  )()
