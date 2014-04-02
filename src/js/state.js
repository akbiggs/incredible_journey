// Generated by CoffeeScript 1.7.1
(function() {
  var State;

  window.State = State = (function() {
    function State() {
      this.objects = this.initializeObjects();
    }

    State.prototype.initializeObjects = function() {
      var center;
      center = $V([200, 200]);
      return _([new Player(center)]).union(this.initializeEnemies(center));
    };

    State.prototype.initializeEnemies = function(center) {
      return _([1, 2, 3, 4, 5]).map(function(i) {
        var offset;
        offset = $V([(Math.random() * 2) - 1, (Math.random() * 2) - 1]);
        return new NormalEnemy(center.add(offset.multiply(100)));
      });
    };

    State.prototype.update = function() {
      return _(this.objects).each(function(obj) {
        return obj.update();
      });
    };

    State.prototype.draw = function(ctx) {
      return _(this.objects).each(function(obj) {
        ctx.save();
        obj.draw(ctx);
        return ctx.restore();
      });
    };

    return State;

  })();

}).call(this);
