// Generated by CoffeeScript 1.7.1
(function() {
  window.loadGame = function() {
    var canvas, ctx, draw, state, update;
    canvas = document.getElementById('game');
    ctx = canvas.getContext('2d');
    window.canvasSize = function() {
      return $V([canvas.width, canvas.height]);
    };
    window.canvasCenter = function() {
      return window.canvasSize().multiply(1 / 2);
    };
    state = new State();
    update = function() {
      kd.tick();
      TWEEN.update();
      return state.update();
    };
    draw = function(ctx) {
      ctx.fillStyle = "white";
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      return state.draw(ctx);
    };
    return setInterval(function() {
      update();
      return draw(ctx);
    }, 1000 / 60);
  };

}).call(this);
