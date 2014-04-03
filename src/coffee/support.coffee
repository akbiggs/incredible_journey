window.Point = class Point
  constructor: (@x, @y) ->

  add: (p) ->
    new Point(@x + p.x, @y + p.y)

  sub: (p) ->
    new Point(@x - p.x, @y - p.y)

  mul: (p) ->
    if typeof p is 'number'
      new Point(@x * p, @y * p)
    else
      new Point(@x * p.x, @y * p.y)

  div: (p) ->
    if typeof p is 'number'
      new Point(@x / p, @y / p)
    else
      new Point(@x / p.x, @y / p.y)

window.Wave = class Wave
  constructor: (@speed) ->
    @angle = 0

  update: ->
    @angle += @speed;

  value: ->
    Math.sin(@angle)

window.Mouse = class Mouse

  @isDown: false
  @position: Vector.Zero(2)

  @_canvas: null

  window.addLoadEvent =>
    Mouse._canvas = $("#game")[0]
    Mouse._canvas.addEventListener('mousemove', (evt) =>
      rect = Mouse._canvas.getBoundingClientRect();
      @position = $V([evt.clientX - rect.left, evt.clientY - rect.top])
    , false)
    Mouse._canvas.addEventListener('mousedown', (evt) =>
      @isDown = true
    , false);
    Mouse._canvas.addEventListener('mouseup', (evt) =>
      @isDown = false
    , false);