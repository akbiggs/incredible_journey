window.State = class State
  constructor: ->
    @objects = []

  update: ->
    _(@objects).each (obj) ->
      obj.update()

  draw: (ctx) ->
    _(@objects).each (obj) ->
      obj.draw(ctx)
