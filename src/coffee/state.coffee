window.State = class State

  @instance: null


  screenSize: Vector.Zero(2)

  players: []
  enemies: []
  particles: []
  bullets: []
  
  _gameObjectLists: ["players", "enemies", "particles", "bullets"]
  _deferredRemoveList: []

  # TODO: Write methods for adding and removing safely to these lists...

  ### GETTERS ###

  getScreenCenter: ->
    return @screenSize.multiply(0.5)

  getAllGameObjects: ->
    return _(@_gameObjectLists).reduce(((memo, listName) => memo.concat @[listName]), [])

  ### MAIN FUNCTIONS ###

  constructor: (screenSize) ->
    State.instance = @

    @screenSize = screenSize

    #@enemies = @_initializeEnemies(@getScreenCenter())
    #@particles = @_testParticles(@getScreenCenter())
    @players = [ new Player(Vector.Zero(2)) ]

    setInterval =>
      @enemies.push new NormalEnemy($V([@screenSize.e(1) + 50, Math.random() * @screenSize.e(2)]))
    , 300

  update: ->
    for obj in @getAllGameObjects()
      obj.update?(@)
    @_applyDeferredRemoveList()

  draw: (ctx) ->
    for obj in @getAllGameObjects()
      ctx.save()
      obj.draw?(ctx)
      ctx.restore()

  ### UTILITIES ###

  removeLater: (listName, element) ->
    @_deferredRemoveList.push { list: listName, element: element }

  _applyDeferredRemoveList: ->
    for pair in @_deferredRemoveList
      @[pair.list] = _(@[pair.list]).without(pair.element)
    @_deferredRemoveList = []

  _initializeEnemies: (center) ->
    _([1..5]).map (i) ->
      offset = Vector.Random(2).subtract [0.5, 0.5]
      return new NormalEnemy(center.add(offset.multiply(100)))

  _testParticles: (center) ->
    _([1..100]).map (i) ->
      offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1])
      return new Particle(center.add(offset.multiply(50)),
        $V([10, 10]), $V([Math.random(), Math.random()]).multiply(2), 'rgb(200, 0, 0)')

  _testDialogues: (ctx) ->
    [ new Dialogue("I am a dumbface", ctx) ]

