// Generated by CoffeeScript 1.7.1
(function() {
  var Img;

  window.Img = Img = (function() {
    function Img() {}

    Img.data = {
      frankie: "images/frankie.png"
    };

    Img.load = function() {
      var name, url, _ref, _results;
      _ref = this.data;
      _results = [];
      for (name in _ref) {
        url = _ref[name];
        this[name] = new Image();
        _results.push(this[name].src = url);
      }
      return _results;
    };

    return Img;

  })();

  window.Img.load();

}).call(this);
