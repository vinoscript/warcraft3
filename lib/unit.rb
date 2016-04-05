class Unit

  attr_accessor :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    enemy.damage(3)
  end

  def damage(amount)
    self.health_points -= amount
  end

end