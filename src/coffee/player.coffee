window.Player = class Player extends GameObject
  constructor: (position) ->
    super(position, $V([100, 100]))

  update: ->
  	if kd.W.isDown()
  		@position = @position.add [0, -1]
  	if kd.S.isDown()
  		@position = @position.add [0, 1]
  	if kd.A.isDown()
  		@position = @position.add [-1, 0]
  	if kd.D.isDown()
  		@position = @position.add [1, 0]
