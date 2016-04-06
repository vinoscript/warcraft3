require_relative 'spec_helper'


# Enhancement 3
# A dead Unit cannot attack another Unit. Conversely, an alive 
# Unit will also not attack another Unit that is already dead.

describe Unit do 

  before :each do
    @dead_unit = Unit.new(0, 20)
    @alive_unit = Unit.new(50, 20)
  end

  describe "#attack!" do

    # dead unit & attack unit = false
    it "does not allow a dead unit to attack an enemy" do
      expect(@dead_unit.attack!(@alive_unit)).to be_falsey
      # @dead_unit.attack!(@alive_unit)
    end

    # alive unit & attack dead unit = false
    it "does not allow a unit to attack a dead enemy" do
      expect(@alive_unit.attack!(@dead_unit)).to be_falsey
      # @alive_unit.attack!(@dead_unit)
    end

  end


  

end
