window.Player = class Player extends GameObject

  acceleration: 0.2
  maxSpeed: 5

  constructor: (position) ->
    super(position, $V([100, 100]))

  update: ->
    accel = Vector.Zero(2)

    if kd.W.isDown()
      accel = accel.add [0, -@acceleration]
    if kd.S.isDown()
      accel = accel.add [0, @acceleration]
    if kd.A.isDown()
      accel = accel.add [-@acceleration, 0]
    if kd.D.isDown()
      accel = accel.add [@acceleration, 0]

    if accel.eql [0, 0]
      @velocity = @velocity.multiply(0.95)
    else
      @velocity = @velocity.add(accel)

    if @velocity.length() > @maxSpeed
      @velocity = @velocity.toUnitVector().multiply(@maxSpeed)

    super()
