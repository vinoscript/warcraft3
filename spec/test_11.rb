require_relative 'spec_helper'

# Enhancement 1
# In most strategy games, like Warcraft III, buildings can also be attacked by Units. 
# Since a Barracks is a building, it has substantially more HP (500). 
# Additionally, a Footman does only half of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.

# The damage amount should be an integer (Fixnum), but the ceiling (ceil) 
# of the division should be used as the resulting amount.

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should do deal 5 (AP)  damage to the enemy building" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(5)
      @footman.attack!(enemy)
    end
  end


end

describe Barracks do

  before :each do
    @barracks = Barracks.new

  end

    describe "#damage" do
    it "should reduce the building's health_points by half of the attack_power specified" do
      @barracks.damage(5)
      expect(@barracks.health_points).to eq(495) # starts at 500
    end
  end

end