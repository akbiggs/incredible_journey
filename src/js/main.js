// Generated by CoffeeScript 1.7.1
(function() {
  var FPS;

  FPS = 60;

  window.addLoadEvent(function() {
    var bgCanvas, bgCtx, canvas, clearCanvas, ctx, draw, state, temp1Canvas, temp1Ctx, temp2Canvas, temp2Ctx, update;
    canvas = document.getElementById('game');
    ctx = canvas.getContext('2d');
    ctx.imageSmoothingEnabled = false;
    ctx.mozImageSmoothingEnabled = false;
    bgCanvas = document.getElementById('bg');
    bgCtx = bgCanvas.getContext('2d');
    bgCtx.imageSmoothingEnabled = false;
    bgCtx.mozImageSmoothingEnabled = false;
    temp1Canvas = document.getElementById('temp1');
    temp1Ctx = temp1Canvas.getContext('2d');
    temp1Ctx.imageSmoothingEnabled = false;
    temp1Ctx.mozImageSmoothingEnabled = false;
    temp2Canvas = document.getElementById('temp2');
    temp2Ctx = temp2Canvas.getContext('2d');
    temp2Ctx.imageSmoothingEnabled = false;
    temp2Ctx.mozImageSmoothingEnabled = false;
    state = new State($V([canvas.width, canvas.height]));
    update = function() {
      kd.tick();
      TWEEN.update();
      return state.update();
    };
    draw = function(ctx) {
      temp1Ctx.save();
      temp1Ctx.translate(canvas.width / 2, canvas.height / 2);
      temp1Ctx.scale(1.5, 1.5);
      temp1Ctx.translate(-canvas.width / 2, -canvas.height / 2);
      temp1Ctx.drawImage(bgCanvas, 0, 0);
      temp1Ctx.restore();
      temp1Ctx.drawImage(canvas, 0, 0);
      bgCtx.globalAlpha = 1;
      bgCtx.drawImage(temp1Canvas, 0, 0);
      bgCtx.globalAlpha = 1;
      temp1Ctx.clearRect(0, 0, canvas.width, canvas.height);
      temp1Ctx.drawImage(canvas, 0, 0);
      temp1Ctx.globalCompositeOperation = "source-in";
      clearCanvas(temp1Canvas, temp1Ctx, getRandomColor());
      temp1Ctx.globalCompositeOperation = "source-over";
      bgCtx.globalAlpha = 0.3;
      bgCtx.drawImage(temp1Canvas, 0, 0);
      bgCtx.globalAlpha = 1;
      temp1Ctx.save();
      temp1Ctx.translate(canvas.width / 2, canvas.height / 2);
      temp1Ctx.rotate(0.05);
      temp1Ctx.translate(-canvas.width / 2, -canvas.height / 2);
      temp1Ctx.drawImage(bgCanvas, 0, 0);
      temp1Ctx.restore();
      bgCtx.globalAlpha = 0.8;
      bgCtx.drawImage(temp1Canvas, 0, 0);
      bgCtx.globalAlpha = 1;
      if (state._flash) {
        temp1Ctx.clearRect(0, 0, canvas.width, canvas.height);
        temp2Ctx.clearRect(0, 0, canvas.width, canvas.height);
        bgCtx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.clearRect(0, 0, canvas.width, canvas.height);
      }
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      state.draw(ctx);
      temp2Ctx.clearRect(0, 0, canvas.width, canvas.height);
      temp2Ctx.drawImage(canvas, 1, 1);
      temp2Ctx.drawImage(canvas, 1, -1);
      temp2Ctx.drawImage(canvas, -1, 1);
      temp2Ctx.drawImage(canvas, -1, -1);
      temp2Ctx.drawImage(canvas, 2, 2);
      temp2Ctx.drawImage(canvas, 2, -2);
      temp2Ctx.drawImage(canvas, -2, 2);
      temp2Ctx.drawImage(canvas, -2, -2);
      temp2Ctx.globalCompositeOperation = "source-in";
      clearCanvas(temp2Canvas, temp2Ctx, "white");
      return temp2Ctx.globalCompositeOperation = "source-over";
    };
    clearCanvas = function(canvas, ctx, color) {
      if (color == null) {
        color = "white";
      }
      ctx.fillStyle = color;
      return ctx.fillRect(0, 0, canvas.width, canvas.height);
    };
    return setInterval(function() {
      update();
      return draw(ctx);
    }, 1000 / FPS);
  });

}).call(this);
