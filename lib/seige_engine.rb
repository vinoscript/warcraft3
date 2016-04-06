
class SeigeEngine < Unit

  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage(attack_power*2)
      return true
    elsif enemy.is_a? SeigeEngine
      enemy.damage(attack_power)
      return true
    else  
      return false
    end
  end

end