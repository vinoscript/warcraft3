class Barracks

  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    true
  end
end
