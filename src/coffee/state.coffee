window.State = class State

  @instance: null


  screenSize: Vector.Zero(2)

  players: []
  enemies: []
  particles: []

  ### GETTERS ###

  getScreenCenter: ->
    return @screenSize.multiply(0.5)

  getAllGameObjects: ->
    return _.chain([])
      .union(@enemies)
      .union(@particles)
      .union(@players)
      .value()

  ### MAIN FUNCTIONS ###

  constructor: (screenSize) ->
    State.instance = @

    @screenSize = screenSize

    @enemies = @initializeEnemies(@getScreenCenter())
    @particles = @testParticles(@getScreenCenter())
    @players = [ new Player(@getScreenCenter()) ]

  update: ->
    for obj in @getAllGameObjects()
      obj.update?()

  draw: (ctx) ->
    for obj in @getAllGameObjects()
      ctx.save()
      obj.draw?(ctx)
      ctx.restore()

  ### UTILITIES ###

  initializeEnemies: (center) ->
    _([1..5]).map (i) ->
      offset = Vector.Random(2).subtract [0.5, 0.5]
      return new NormalEnemy(center.add(offset.multiply(100)))

  testParticles: (center) ->
    _([1..100]).map (i) ->
      offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1])
      return new Particle(center.add(offset.multiply(50)),
        $V([10, 10]), $V([Math.random(), Math.random()]).multiply(2), 'rgb(200, 0, 0)')

  testDialogues: (ctx) ->
    [ new Dialogue("I am a dumbface", ctx) ]

