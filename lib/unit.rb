class Unit

  attr_reader :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    if self.dead? || enemy.dead?
      return false
    else
      if enemy.is_a? Barracks
        enemy.damage(attack_power/2)
        return true
      else
        enemy.damage(attack_power)
        return true
      end
    end
  end

  def damage(amount)
    @health_points -= amount
  end

  def dead?
    health_points > 0 ? false : true
  end

end