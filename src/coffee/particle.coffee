window.Particle = class Particle extends GameObject
  constructor: (position, size, velocity, color, properties) ->

    defaults =
      rotation: 0
      rotationDelta: Math.random() / 20
      initialLifespan: 20
      acceleration: $V([0, 0])

    properties = Object.extend(defaults, properties)

    super(position, size, velocity)

    for key, value of properties
      @[key] = value

    @lifespan = @initialLifespan

  update: (state) ->
    @lifespan = Math.max(0, @lifespan - 1)
    @velocity = @velocity.add(@acceleration)
    @rotation += @rotationDelta
    super(state)

  draw: (ctx) ->
    ctx.globalAlpha = @lifespan / @initialLifespan
    ctx.fillStyle = @color
    super(ctx)
