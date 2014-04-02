window.Dialogue = class Dialogue

  constructor: (@text, ctx, properties) ->
    defaults =
      offscreenOffset: $V([0, -40])
      alpha: 0
      easeInTime: 1000
      waitTime: 2000
      easeOutTime: 1000
      color: 'rgb(0, 0, 0)'
      font: '40pt Calibri'
    properties = Object.extend(defaults, properties)

    for key, value of properties
      @[key] = value

    {@x, @y} = @calculateOffscreenPosition(@offscreenOffset)

    ctx.save()
    ctx.font = @font
    textSize = ctx.measureText(@text)

    @enterTween = new TWEEN.Tween(@)
      .to({x: window.canvasCenter().e(1) - textSize.width/2, y: window.canvasCenter().e(2), alpha: 1}, @easeInTime)
      .easing( TWEEN.Easing.Elastic.In )
      .onUpdate =>
        console.log "Posiiton is now: " + @x + ", " + @y
        console.log "Alpha is now " + @alpha
      .start()

    # @exitTween = new TWEEN.Tween(@)
    #   .to({position: @calculateOffscreenPosition(@offscreenOffset.x(-1)), alpha: 0}, @easeOutTime)
    #   .easing( TWEEN.Easing.Elastic.Out )
    #   .delay(@easeInTime + @waitTime)

    ctx.restore()

  calculateOffscreenPosition: (offset) ->
    position = x: 0, y: 0

    if offset.e(1) < 0
      position.x = -offset.e(1)
    else if offset.e(1) > 0
      position.x = window.canvasSize().e(1) + offset.e(1)

    if offset.e(2) < 0
      position.y = -offset.e(2)
    else if offset.e(2) > 0
      position.y = window.canvasSize().e(2) + offset.e(2)

    return position

  update: ->
    # pass

  draw: (ctx) ->
    ctx.globalAlpha = @alpha
    ctx.fillStyle = @color
    ctx.font = @font

    ctx.fillText @text, @x, @y
