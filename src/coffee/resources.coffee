window.Img = class Img

  @data:  
    frankie: "images/frankie.png"

  @load: ->
    for name, url of @data
      @[name] = new Image()
      @[name].src = url

window.Img.load()