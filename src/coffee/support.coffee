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
