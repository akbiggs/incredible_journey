window.Bullet = class Bullet extends GameObject

  desiredVelocity: null
  multiplyFactor: 0.02

  constructor: (position, size, velocity, desiredVelocity = $V([15, 0]), multiplyFactor = 0.1) ->
    super(position, size, velocity)

    @wave = new Wave(0.1)
    @desiredVelocity = desiredVelocity
    @multiplyFactor = multiplyFactor

  update: ->
    @velocity = @velocity.add(@desiredVelocity.subtract(@velocity).multiply(@multiplyFactor))

    super()

    for enemy in State.instance.enemies
      if enemy.isRadialCollidingWith(@)
        State.instance.enemies = _(State.instance.enemies).without(enemy) #TODO: Use better remove
        State.instance.bullets = _(State.instance.bullets).without(@) #TODO: Use better remove

    if not @withinScreen()
      State.instance.bullets = _(State.instance.bullets).without(@) #TODO: Use better remove