// Generated by CoffeeScript 1.7.1
(function() {
  var FPS;

  FPS = 60;

  window.loadGame = function() {
    var canvas, ctx, draw, state, update;
    canvas = document.getElementById('game');
    ctx = canvas.getContext('2d');
    state = new State($V([canvas.width, canvas.height]));
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
    }, 1000 / FPS);
  };

}).call(this);
