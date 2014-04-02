window.GameObject = class GameObject
  @showHitboxes: yes

  constructor: (@position, @size) ->

  update: ->

  draw: (ctx) ->
    ctx.save()

    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      ctx.fillRect(@position.e(1), @position.e(2), @size.e(1), @size.e(2))

    ctx.restore()
