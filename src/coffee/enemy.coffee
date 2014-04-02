window.NormalEnemy = class NormalEnemy extends GameObject
  constructor: (position) ->
    super(position, $V([70, 70]))
    @wave = new Wave(0.1)
