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

  @canvas: null

  window.addLoadEvent ->
    Mouse.canvas = $("#game")[0]

  @getPosition: (canvas, evt) ->
    rect = canvas.getBoundingClientRect();
    return {
      x: evt.clientX - rect.left,
      y: evt.clientY - rect.top
    }