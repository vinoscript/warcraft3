require_relative 'spec_helper'

# Enhancement 5
# Introduce a SiegeEngine Unit. The SiegeEngine is very effective against 
# buildings such as the Barracks. However, it is ineffective against other 
# Units. (It can't attack them, as if they were dead.)

# So unlike with Footman (whose attacks do a fraction of the damage they 
#   normally would,) a SiegeEngine does 2× damage against a Barracks.

# Also, SiegeEngines can attack other SiegeEngines even though they cannot 
# attack any other Units (such as Peasants or Footmans.)

# SiegeEngines are initialized with these stats.

# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food

# Make note, you will need to require the seige_engine.rb file in spec_helper.rb.

describe SeigeEngine do

  describe "initialization" do

    it "has default value for AP and HP" do
      unit = SeigeEngine.new
      unit.health_points == 400
      unit.attack_power == 50
    end

  end

  describe "#attack!" do

    before :each do
      @seige_engine = SeigeEngine.new
    end

    it "should do deal 50 (AP) damage to the enemy Barrack (resulting in 100 damage)" do
      enemy = Barracks.new
      # expect(enemy).to receive(:damage).with(100)
      @seige_engine.attack!(enemy)
      expect(enemy.health_points).to eq(400)
    end

    it "should do deal 50 (AP) damage to the enemy SeigeEngine (resulting in 50 damage)" do
      enemy = SeigeEngine.new
      expect(enemy).to receive(:damage).with(50)
      @seige_engine.attack!(enemy)
    end

    it "should not be able to attack other Units such as Peasants or Footmans" do 
      enemy = Footman.new
      expect(@seige_engine.attack!(enemy)).to be_falsey
      @seige_engine.attack!(enemy)
    end

  end

  # Note: shouldn't need to test #damage function again?
  # describe "#damage" do

  #   it "should take damage when another SeigeEngine attacks it" do 

  #   end

  # end

end


describe Barracks do

  # Should not need to test Barracks#damage because we already tested this before?
  describe "#damage" do

    it "should reduce the Barrack's health_points by double the SeigeEngine's AP " do
      # seige_engine = SeigeEngine.new
      barrack = Barracks.new
      barrack.damage(100)
      expect(barrack.health_points).to eq(400)  #starts at 500
    end

  end

  describe "#build_seige_engine" do

    before :each do
      @barracks = Barracks.new
    end

    it "does not build a seige engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_build_seige_engine?).and_return(false)
      expect(@barracks.build_seige_engine).to be_nil
    end

    it "builds a seige engine if there are enough resources" do
      expect(@barracks).to receive(:can_build_seige_engine?).and_return(true)
      expect(@barracks.build_seige_engine).to be_a(SeigeEngine)
    end

  end

  describe "#can_build_seige_engine?" do

    before :each do
      @barracks = Barracks.new
    end

    it "returns true if there are enough resources to build a seige seige_engine" do
      expect(@barracks.can_build_seige_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_build_seige_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(150)
      expect(@barracks.can_build_seige_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(25)
      expect(@barracks.can_build_seige_engine?).to be_falsey
    end

  end

end






