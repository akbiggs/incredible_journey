window.Bullet = class Bullet extends GameObject

  desiredVelocity: null
  multiplyFactor: 0.02

  constructor: (position, size, velocity, desiredVelocity = $V([15, 0]), multiplyFactor = 0.1) ->
    super(position, size, velocity)

    @wave = new Wave(0.1)
    @desiredVelocity = desiredVelocity
    @multiplyFactor = multiplyFactor

  update: (state) ->
    @velocity = @velocity.add(@desiredVelocity.subtract(@velocity).multiply(@multiplyFactor))

    super()

    for enemy in State.instance.enemies
      if enemy.isRadialCollidingWith(@)
        state.removeLater("enemies", enemy)
        state.removeLater("bullets", @)
        state.flash()

    if not @withinScreen()
      state.removeLater("bullets", @)