window.NormalEnemy = class NormalEnemy extends GameObject

  constructor: (position) ->
    super(position, $V([70, 70]))
    @wave = new Wave(0.05)
    @desiredVelocity = $V [-5, 0]
    @multiplyFactor = 0.1

  update: (state) ->
  	@velocity = @velocity.add(@desiredVelocity.subtract(@velocity).multiply(@multiplyFactor))

  	super(state)

  	if @position.e(1) < 0
  		state.removeLater("enemies", @)
