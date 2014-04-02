// Generated by CoffeeScript 1.7.1
(function() {
  var Point;

  window.Point = Point = (function() {
    function Point(x, y) {
      this.x = x;
      this.y = y;
    }

    Point.prototype.add = function(p) {
      return new Point(this.x + p.x, this.y + p.y);
    };

    Point.prototype.sub = function(p) {
      return new Point(this.x - p.x, this.y - p.y);
    };

    Point.prototype.mul = function(p) {
      if (typeof p === 'number') {
        return new Point(this.x * p, this.y * p);
      } else {
        return new Point(this.x * p.x, this.y * p.y);
      }
    };

    Point.prototype.div = function(p) {
      if (typeof p === 'number') {
        return new Point(this.x / p, this.y / p);
      } else {
        return new Point(this.x / p.x, this.y / p.y);
      }
    };

    return Point;

  })();

}).call(this);