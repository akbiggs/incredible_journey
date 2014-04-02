// Generated by CoffeeScript 1.7.1
(function() {
  window.loadGame = function() {
    var canvas, ctx, draw, state, update;
    state = new State();
    canvas = document.getElementById('game');
    ctx = canvas.getContext('2d');
    update = function() {
      return state.update();
    };
    draw = function(ctx) {
      ctx.fillStyle = "white";
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      state.draw(ctx);
      return ctx.drawImage(Img.frankie, 10, 10, 100, 100);
    };
    return setInterval(function() {
      update();
      return draw(ctx);
    }, 1000 / 30);
  };

}).call(this);
