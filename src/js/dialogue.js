// Generated by CoffeeScript 1.7.1
(function() {
  var Dialogue;

  window.Dialogue = Dialogue = (function() {
    function Dialogue(text, ctx, properties) {
      var defaults, key, textSize, value, _ref;
      this.text = text;
      defaults = {
        offscreenOffset: $V([0, -40]),
        alpha: 0,
        easeInTime: 1000,
        waitTime: 2000,
        easeOutTime: 1000,
        color: 'rgb(0, 0, 0)',
        font: '40pt Calibri'
      };
      properties = Object.extend(defaults, properties);
      for (key in properties) {
        value = properties[key];
        this[key] = value;
      }
      _ref = this.calculateOffscreenPosition(this.offscreenOffset), this.x = _ref.x, this.y = _ref.y;
      ctx.save();
      ctx.font = this.font;
      textSize = ctx.measureText(this.text);
      this.enterTween = new TWEEN.Tween(this).to({
        x: State.instance.getScreenCenter().e(1) - textSize.width / 2,
        y: State.instance.getScreenCenter().e(2),
        alpha: 1
      }, this.easeInTime).easing(TWEEN.Easing.Elastic.In).onUpdate((function(_this) {
        return function() {
          console.log("Posiiton is now: " + _this.x + ", " + _this.y);
          return console.log("Alpha is now " + _this.alpha);
        };
      })(this)).start();
      ctx.restore();
    }

    Dialogue.prototype.calculateOffscreenPosition = function(offset) {
      var position;
      position = {
        x: 0,
        y: 0
      };
      if (offset.e(1) < 0) {
        position.x = -offset.e(1);
      } else if (offset.e(1) > 0) {
        position.x = window.canvasSize().e(1) + offset.e(1);
      }
      if (offset.e(2) < 0) {
        position.y = -offset.e(2);
      } else if (offset.e(2) > 0) {
        position.y = window.canvasSize().e(2) + offset.e(2);
      }
      return position;
    };

    Dialogue.prototype.update = function() {};

    Dialogue.prototype.draw = function(ctx) {
      ctx.globalAlpha = this.alpha;
      ctx.fillStyle = this.color;
      ctx.font = this.font;
      return ctx.fillText(this.text, this.x, this.y);
    };

    return Dialogue;

  })();

}).call(this);