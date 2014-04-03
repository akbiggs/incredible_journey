FPS = 60


window.loadGame = ->

  canvas = document.getElementById('game')
  ctx = canvas.getContext('2d')
  ctx.imageSmoothingEnabled = false
  ctx.mozImageSmoothingEnabled = false

  bgCanvas = document.getElementById('bg')
  bgCtx = bgCanvas.getContext('2d')
  bgCtx.imageSmoothingEnabled = false
  bgCtx.mozImageSmoothingEnabled = false

  temp1Canvas = document.getElementById('temp1')
  temp1Ctx = temp1Canvas.getContext('2d')
  temp1Ctx.imageSmoothingEnabled = false
  temp1Ctx.mozImageSmoothingEnabled = false

  temp2Canvas = document.getElementById('temp2')
  temp2Ctx = temp2Canvas.getContext('2d')
  temp2Ctx.imageSmoothingEnabled = false
  temp2Ctx.mozImageSmoothingEnabled = false

  state = new State($V([canvas.width, canvas.height]))

  update = ->
    kd.tick()
    TWEEN.update()
    state.update()

  draw = (ctx) ->

    # Build the next frame for the background on temp1Ctx using the old background.
    temp1Ctx.save()
    temp1Ctx.translate(canvas.width / 2, canvas.height / 2)
    temp1Ctx.scale(1.5, 1.5)
    temp1Ctx.translate(-canvas.width / 2, -canvas.height / 2)
    temp1Ctx.drawImage(bgCanvas, 0, 0)
    temp1Ctx.restore()
    temp1Ctx.drawImage(canvas, 0, 0)
    
    # Draw the new background from temp1Ctx to bgCtx
    bgCtx.globalAlpha = 0.8
    bgCtx.drawImage(temp1Canvas, 0, 0)
    bgCtx.globalAlpha = 1

    # Draw the tinted frame on temp1Ctx
    temp1Ctx.clearRect(0, 0, canvas.width, canvas.height);
    temp1Ctx.drawImage(canvas, 0, 0)
    temp1Ctx.globalCompositeOperation = "source-in"
    clearCanvas(temp1Canvas, temp1Ctx, getRandomColor())
    temp1Ctx.globalCompositeOperation = "source-over"

    # Draw the tinted frame, with alpha, onto the background.
    bgCtx.globalAlpha = 0.3
    bgCtx.drawImage(temp1Canvas, 0, 0)
    bgCtx.globalAlpha = 1

    # Draw the bgCtx to temp1Ctx rotated slightly.
    temp1Ctx.save()
    temp1Ctx.translate(canvas.width / 2, canvas.height / 2)
    temp1Ctx.rotate(0.05)
    temp1Ctx.translate(-canvas.width / 2, -canvas.height / 2)
    temp1Ctx.drawImage(bgCanvas, 0, 0)
    temp1Ctx.restore()

    # Draw temp1Ctx to bgCtx
    bgCtx.globalAlpha = 0.8
    bgCtx.drawImage(temp1Canvas, 0, 0)
    bgCtx.globalAlpha = 1

    # Draw plain scene.
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    state.draw(ctx)

    # Draw outlines on temp2Ctx.
    temp2Ctx.clearRect(0, 0, canvas.width, canvas.height);
    temp2Ctx.drawImage(canvas, 1, 1)
    temp2Ctx.drawImage(canvas, 1, -1)
    temp2Ctx.drawImage(canvas, -1, 1)
    temp2Ctx.drawImage(canvas, -1, -1)
    temp2Ctx.globalCompositeOperation = "source-in"
    clearCanvas(temp2Canvas, temp2Ctx, "black")
    temp2Ctx.globalCompositeOperation = "source-over"

  clearCanvas = (canvas, ctx, color = "white") ->
    ctx.fillStyle = color;
    ctx.fillRect(0, 0, canvas.width, canvas.height)

  setInterval ->
    update()
    draw(ctx)
  , 1000 / FPS
