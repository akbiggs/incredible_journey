FPS = 60


window.loadGame = ->

  canvas = document.getElementById('game')
  ctx = canvas.getContext('2d')

  state = new State($V([canvas.width, canvas.height]))

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
  , 1000 / FPS
