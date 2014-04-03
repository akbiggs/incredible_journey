// Generated by CoffeeScript 1.7.1
(function() {
  var ACCELERATION, COOLDOWN_TIME, MAX_SPEED, Player,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ACCELERATION = 0.2;

  MAX_SPEED = 5;

  COOLDOWN_TIME = 10;

  window.Player = Player = (function(_super) {
    __extends(Player, _super);

    Player.prototype.bulletCooldown = 0;

    function Player(position) {
      Player.__super__.constructor.call(this, position, $V([100, 100]));
      this.scale = 1.3;
      this.wave = new Wave(0.1);
    }

    Player.prototype.update = function(state) {
      var accel, enemy, _i, _len, _ref, _results;
      accel = Vector.Zero(2);
      if (kd.W.isDown()) {
        accel = accel.add([0, -ACCELERATION]);
      }
      if (kd.S.isDown()) {
        accel = accel.add([0, ACCELERATION]);
      }
      if (kd.A.isDown()) {
        accel = accel.add([-ACCELERATION, 0]);
      }
      if (kd.D.isDown()) {
        accel = accel.add([ACCELERATION, 0]);
      }
      if (accel.eql([0, 0])) {
        this.velocity = this.velocity.multiply(0.95);
      } else {
        this.velocity = this.velocity.add(accel);
      }
      if (this.velocity.length() > MAX_SPEED) {
        this.velocity = this.velocity.toUnitVector().multiply(MAX_SPEED);
      }
      Player.__super__.update.call(this, state);
      if (Mouse.isDown && this.bulletCooldown <= 0) {
        this.bulletCooldown = COOLDOWN_TIME;
        state.bullets.push(new Bullet(this.position.add([20, 30]), $V([30, 30]), $V([25, 0]), Mouse.position.subtract(this.position).toUnitVector().multiply(10), 0.2));
      }
      if (this.bulletCooldown > 0) {
        this.bulletCooldown--;
      }
      _ref = State.instance.enemies;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        enemy = _ref[_i];
        if (enemy.isRadialCollidingWith(this)) {
          _results.push(console.log("OWW!"));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    Player.prototype.draw = function(ctx) {
      this.image = this.bulletCooldown > COOLDOWN_TIME / 2 ? Img.frankieOpen : Img.frankie;
      return Player.__super__.draw.call(this, ctx);
    };

    return Player;

  })(GameObject);

}).call(this);
