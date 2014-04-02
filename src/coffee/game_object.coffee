window.GameObject = class GameObject

  @showHitboxes: true


  position: null
  size: null
  velocity: $V [0,0]

  rotation: 0
  scale: 1
  image: null

  wave: new Wave(0)

  ### GETTERS ###

  getCenter: ->
    return @position.add(@getHalfSize())

  getHalfSize: ->
    return @size.x(1/2)

  getRadius: ->
    return @size.e(0) / 2

  ### MAIN FUNCTIONS ###

  constructor: (@position, @size, params = {}) ->
    for param, value in params
      @[param] = value

    @image = Img.frankie

  update: ->
    @wave.update()
    @position = @position.add(@velocity)

  draw: (ctx) ->
    center = @getCenter()
    ctx.translate(center.e(1), center.e(2))

    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      ctx.beginPath();
      ctx.arc(0, 0, @size.e(1) / 2, 0, Math.PI*2, true)
      ctx.closePath();
      ctx.fill();

    ctx.rotate(@rotation + @wave.value() * 0.2)
    scale = @scale + @wave.value() * 0.1
    ctx.scale(scale, scale)

    if @image?
      ctx.drawImage(@image, -@size.e(1) / 2, -@size.e(2) / 2, @size.e(1), @size.e(2))

  ### UTILITIES ###

  isCollidingWith: (otherGameObject) ->
    return false

