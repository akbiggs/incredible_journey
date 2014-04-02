window.GameObject = class GameObject

  @showHitboxes: yes

  image: null

  constructor: (@position, @size) ->
  	@image = Img.frankie

  update: ->

  draw: (ctx) ->
    if GameObject.showHitboxes
      ctx.fillStyle = 'rgb(200,0,0)'
      ctx.rotate(0.1);
      ctx.fillRect(@position.e(1), @position.e(2), @size.e(1), @size.e(2))

    if @image?
      ctx.drawImage(@image, @position.e(1), @position.e(2), @size.e(1), @size.e(2))
