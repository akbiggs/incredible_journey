window.State = class State

  enemies: @initializeEnemies(center)
  particles: @testParticles(center)
  players: [ new Player(center) ]

  constructor: ->
    return

  allObjects: ->
    return _.chain([])
      .union(@enemies)
      .union(@particles)
      .union(@players)
      .value()

  initializeEnemies: (center) ->
    _([1..5]).map (i) ->
      offset = Vector.Random(2).subtract [0.5, 0.5]
      return new NormalEnemy(center.add(offset.multiply(100)))

  testParticles: (center) ->
    _([1..100]).map (i) ->
      offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1])
      return new Particle(center.add(offset.multiply(50)),
        $V([10, 10]), $V([Math.random(), Math.random()]).multiply(2), 'rgb(200, 0, 0)')

  update: ->
    for obj in @allObjects()
      obj.update()

  draw: (ctx) ->
    for obj in @allObjects()
      ctx.save()
      obj.draw(ctx)
      ctx.restore()
