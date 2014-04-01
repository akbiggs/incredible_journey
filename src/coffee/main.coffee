window.myTest = ->
  state = new State()

  canvas = document.getElementById('game')
  ctx = canvas.getContext('2d')

  update = ->
    state.update()

  draw = (ctx) ->
    ctx.clearRect(0, 0, 400, 400)

    state.draw(ctx)

  setInterval ->
    update()
    draw(ctx)
  , 1000/30
