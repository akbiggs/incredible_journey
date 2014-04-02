ACCELERATION = 0.2
MAX_SPEED = 5
COOLDOWN_TIME = 10

window.Player = class Player extends GameObject

  bulletCooldown: 0

  constructor: (position) ->
    super(position, $V([100, 100]))
    @scale = 1.3
    @wave = new Wave(0.1)

  update: ->
    accel = Vector.Zero(2)

    if kd.W.isDown()
      accel = accel.add [0, -ACCELERATION]
    if kd.S.isDown()
      accel = accel.add [0, ACCELERATION]
    if kd.A.isDown()
      accel = accel.add [-ACCELERATION, 0]
    if kd.D.isDown()
      accel = accel.add [ACCELERATION, 0]

    if accel.eql [0, 0]
      @velocity = @velocity.multiply(0.95)
    else
      @velocity = @velocity.add(accel)

    if @velocity.length() > MAX_SPEED
      @velocity = @velocity.toUnitVector().multiply(MAX_SPEED)

    super()

    if kd.SPACE.isDown() && @bulletCooldown <= 0
      @bulletCooldown = COOLDOWN_TIME
      State.instance.bullets.push new Bullet(@position.add([0, 30]), $V([30, 30]), $V([25, 0]), $V([10, 0]), 0.2) #TODO: Use better add

    if @bulletCooldown > 0
      @bulletCooldown--

    for enemy in State.instance.enemies
      if enemy.isRadialCollidingWith(@)
        console.log("OWW!")

  draw: (ctx) ->
    @image = if @bulletCooldown > COOLDOWN_TIME / 2 then Img.frankieOpen else Img.frankie
    super(ctx)