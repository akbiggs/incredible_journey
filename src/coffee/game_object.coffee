window.GameObject = class GameObject
  @showHitboxes: yes

  constructor: (@position, @size, @velocity = $V([0, 0]), @rotation = 0) ->

  update: ->
    @position = @position.add(@velocity)

  draw: (ctx) ->
    ctx.save()

    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      ctx.rotate(@rotation)
      ctx.fillRect(@position.e(1), @position.e(2), @size.e(1), @size.e(2))

    ctx.restore()
