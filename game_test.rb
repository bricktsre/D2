require 'minitest/autorun'
require_relative 'game'

class Game_test < Minitest::Test

	# UNIT TESTS FOR METHOD one_type_is_zero?(x)
	# Succes Cases: if x[0] or x[1] is zero
	# Failure Cases: x[0] and x[1] are not both not zero
	# Tests if returns true if one is zero
	def test_one_element_is_zero
		g = Game.new(0,0,0)
		assert(g.one_type_is_zero?([1,0]))
	end
	
	# Tests if returns false if both are not zero
	def test_neither_element_is_zero
		g = Game.new(0,0,0)
		refute(g.one_type_is_zero?([1,1]))
	end

	# UNIT TESTS FOR change_cities(x,y)
	# changes the city of miner x randomly
	# prints out where miner left and is going to
	def test_change_city
		g = Game.new(0,0,0)
		mocked_city = Minitest::Mock.new("mocked city")
		def mocked_city.get_neighboring_city(x); 1; end
		def mocked_city.name; 'Town'; end
		
		mocked_miner = Minitest::Mock.new("mocked miner")
		def mocked_miner.change_city(x); 1; end
		def mocked_miner.current_city; 0; end

		assert_output("Heading from Town to Town.\n") {g.change_cities(mocked_miner,[mocked_city])}
	end
end
