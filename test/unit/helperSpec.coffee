###
helperSpec.coffee
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
describe 'queue', ->
  it '异步调用', ->
    obj =
      value: null
    JU.queue([
      (callback)->
        self = this
        setTimeout(->
          self.value = 10
          callback(20)
        , 200)
      ,(callback, add)->
        expect(this.value + add).toEqual(30)
        callback()
      ,->
        expect(obj.value).toEqual(10)
    ], obj)
