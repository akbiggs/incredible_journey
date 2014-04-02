window.State = class State
  constructor: ->
    @objects = @initializeObjects()

  initializeObjects: ->
    center = $V([200, 200])
    return _.chain([new Player(center)])
      .union(@initializeEnemies(center))
      .union(@testParticles(center))
      .value()

  initializeEnemies: (center) ->
    _([1..5]).map (i) ->
      offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1])
      return new NormalEnemy(center.add(offset.multiply(100)))

  testParticles: (center) ->
    _([1..100]).map (i) ->
      offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1])
      return new Particle(center.add(offset.multiply(50)),
        $V([10, 10]), $V([Math.random(), Math.random()]).multiply(2), 'rgb(200, 0, 0)')

  update: ->
    for obj in @objects
      obj.update()

  draw: (ctx) ->
    for obj in @objects
      ctx.save()
      obj.draw(ctx)
      ctx.restore()
