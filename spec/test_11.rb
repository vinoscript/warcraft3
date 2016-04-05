require_relative 'spec_helper'

# Enhancement 1
# In most strategy games, like Warcraft III, buildings can also be attacked by Units. 
# Since a Barracks is a building, it has substantially more HP (500). 
# Additionally, a Footman does only half of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.

# The damage amount should be an integer (Fixnum), but the ceiling (ceil) 
# of the division should be used as the resulting amount.

