window.Particle = class Particle extends GameObject
  constructor: (position, size, velocity, color, properties) ->
    defaults =
      rotation: 0
      rotationDelta: Math.random() / 20
      initialLifespan: 20
      acceleration: $V([0, 0])
    properties = Object.extend(defaults, properties)
    for key, value of properties
      @[key] = value

    @lifespan = @initialLifespan

    super(position, size, velocity, @rotation)

  update: ->
    @lifespan = Math.max(0, @lifespan - 1)
    @velocity = @velocity.add(@acceleration)
    @rotation += @rotationDelta
    super()

  draw: (ctx) ->
    ctx.globalAlpha = @lifespan / @initialLifespan
    ctx.fillStyle = @color
    super(ctx)
