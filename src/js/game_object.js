// Generated by CoffeeScript 1.7.1
(function() {
  var GameObject;

  window.GameObject = GameObject = (function() {
    GameObject.showHitboxes = true;

    GameObject.prototype.position = null;

    GameObject.prototype.size = null;

    GameObject.prototype.velocity = null;

    GameObject.prototype.rotation = 0;

    GameObject.prototype.scale = 1;

    GameObject.prototype.image = null;

    GameObject.prototype.wave = new Wave(0);


    /* GETTERS */

    GameObject.prototype.getCenter = function() {
      return this.position.add(this.getHalfSize());
    };

    GameObject.prototype.getHalfSize = function() {
      return this.size.x(1 / 2);
    };

    GameObject.prototype.getRadius = function() {
      return this.size.e(0) / 2;
    };


    /* MAIN FUNCTIONS */

    function GameObject(position, size, params) {
      var param, value, _i, _len;
      this.position = position;
      this.size = size;
      for (value = _i = 0, _len = params.length; _i < _len; value = ++_i) {
        param = params[value];
        this[param] = value;
      }
      this.image = Img.frankie;
    }

    GameObject.prototype.update = function() {
      this.wave.update();
      return this.position = this.position.add(this.velocity);
    };

    GameObject.prototype.draw = function(ctx) {
      var center, scale;
      center = this.getCenter();
      ctx.translate(center.e(1), center.e(2));
      if (GameObject.showHitboxes) {
        ctx.fillStyle = 'rgb(200,0,0)';
        ctx.beginPath();
        ctx.arc(0, 0, this.size.e(1) / 2, 0, Math.PI * 2, true);
        ctx.closePath();
        ctx.fill();
      }
      ctx.rotate(this.rotation + this.wave.value() * 0.2);
      scale = this.scale + this.wave.value() * 0.1;
      ctx.scale(scale, scale);
      if (this.image != null) {
        return ctx.drawImage(this.image, -this.size.e(1) / 2, -this.size.e(2) / 2, this.size.e(1), this.size.e(2));
      }
    };


    /* UTILITIES */

    GameObject.prototype.isCollidingWith = function(otherGameObject) {
      return false;
    };

    return GameObject;

  })();

}).call(this);
