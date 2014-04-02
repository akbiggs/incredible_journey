// Generated by CoffeeScript 1.7.1
(function() {
  var Bullet,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Bullet = Bullet = (function(_super) {
    __extends(Bullet, _super);

    Bullet.prototype.desiredVelocity = null;

    Bullet.prototype.multiplyFactor = 0.02;

    function Bullet(position, size, velocity, desiredVelocity, multiplyFactor) {
      if (desiredVelocity == null) {
        desiredVelocity = $V([15, 0]);
      }
      if (multiplyFactor == null) {
        multiplyFactor = 0.1;
      }
      Bullet.__super__.constructor.call(this, position, size, velocity);
      this.wave = new Wave(0.1);
      this.desiredVelocity = desiredVelocity;
      this.multiplyFactor = multiplyFactor;
    }

    Bullet.prototype.update = function() {
      var enemy, _i, _len, _ref;
      this.velocity = this.velocity.add(this.desiredVelocity.subtract(this.velocity).multiply(this.multiplyFactor));
      Bullet.__super__.update.call(this);
      _ref = State.instance.enemies;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        enemy = _ref[_i];
        if (enemy.isRadialCollidingWith(this)) {
          State.instance.enemies = _(State.instance.enemies).without(enemy);
        }
      }
      if (!this.withinScreen()) {
        return State.instance.bullets = _(State.instance.bullets).without(this);
      }
    };

    return Bullet;

  })(GameObject);

}).call(this);