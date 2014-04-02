window.GameObject = class GameObject

  @showHitboxes: yes


  image: null

  constructor: (@position, @size, @velocity = $V([0, 0]), @rotation = 0) ->
    @image = Img.frankie

  update: ->
    @position = @position.add(@velocity)

  draw: (ctx) ->
    ctx.rotate(@rotation)

    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      # ctx.fillRect(@position.e(1), @position.e(2), @size.e(1), @size.e(2))
      ctx.beginPath();
      ctx.arc(@position.e(1), @position.e(2), @size.e(1) / 2, 0, Math.PI*2, true); 
      ctx.closePath();
      ctx.fill();

    if @image?
      ctx.drawImage(@image, @position.e(1), @position.e(2), @size.e(1), @size.e(2))
