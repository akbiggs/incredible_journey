window.GameObject = class GameObject

  @showHitboxes: yes
  image: null

  constructor: (@position, @size, @velocity = $V([0, 0]), @rotation = 0) ->
  	@image = Img.frankie

  update: ->
    @position = @position.add(@velocity)

  center: ->
    @position.add(@centerOffset())

  centerOffset: ->
    @size.x(1/2)

  draw: (ctx) ->
    center = @center()
    negCenterOffset = @centerOffset().x(-1)

    ctx.translate(center.e(1), center.e(2))
    ctx.rotate(@rotation)
    ctx.translate(negCenterOffset.e(1), negCenterOffset.e(2))

    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      ctx.fillRect(0, 0, @size.e(1), @size.e(2))

    if @image?

      ctx.drawImage(@image, 0, 0, @size.e(1), @size.e(2))
