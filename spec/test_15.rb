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

