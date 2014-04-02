window.State = class State
  constructor: ->
    @objects = @initializeObjects()

  initializeObjects: ->
    center = $V([200, 200])
    return _([new Player(center)]).union(@initializeEnemies(center))

  initializeEnemies: (center) ->
    _([1..5]).map (i) ->
      offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1])
      return new NormalEnemy(center.add(offset.multiply(100)))

  update: ->
    _(@objects).each (obj) ->
      obj.update()

  draw: (ctx) ->
    _(@objects).each (obj) ->
      ctx.save()
      obj.draw(ctx)
      ctx.restore()
