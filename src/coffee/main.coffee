window.loadGame = ->
  state = new State()

  canvas = document.getElementById('game')
  ctx = canvas.getContext('2d')

  update = ->
    state.update()

  draw = (ctx) ->
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, canvas.width, canvas.height)
    state.draw(ctx)

  setInterval ->
    update()
    draw(ctx)
  , 1000/30
