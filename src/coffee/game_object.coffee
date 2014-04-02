window.Pulser = class Pulser

window.GameObject = class GameObject

  @showHitboxes: yes


  image: null

  constructor: (@position, @size, @velocity = $V([0, 0]), @rotation = 0, @scale = 1) ->
    @image = Img.frankie
    @wave = new Wave(0)

  center: ->
    @position.add(@halfSize())

  halfSize: ->
    @size.x(1/2)


  update: ->
    @wave.update()
    @position = @position.add(@velocity)

  draw: (ctx) ->
    center = @center()

    ctx.translate(center.e(1), center.e(2))

    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      ctx.beginPath();
      ctx.arc(0, 0, @size.e(1) / 2, 0, Math.PI*2, true)
      ctx.closePath();
      ctx.fill();
      #ctx.fillRect(0, 0, @size.e(1), @size.e(2))

    ctx.rotate(@rotation + @wave.value() * 0.2)
    scale = @scale + @wave.value() * 0.1
    ctx.scale(scale, scale)

    if @image?
      ctx.drawImage(@image, -@size.e(1) / 2, -@size.e(2) / 2, @size.e(1), @size.e(2))
