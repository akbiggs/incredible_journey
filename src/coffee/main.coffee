window.loadGame = ->
  canvas = document.getElementById('game')
  ctx = canvas.getContext('2d')

  window.canvasSize = ->
    $V [canvas.width, canvas.height]

  window.screenCenter = ->
    window.canvasSize().multiply(1/2)

  state = new State()

  update = ->
    kd.tick()
    TWEEN.update()

    state.update()

  draw = (ctx) ->
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, canvas.width, canvas.height)
    state.draw(ctx)

  setInterval ->
    update()
    draw(ctx)
  , 1000/30
