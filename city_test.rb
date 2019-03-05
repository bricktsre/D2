require 'minitest/autorun'
require_relative 'city'

class City_test < Minitest::Test
	
	# UNIT TESTS FOR METHOD get_neighboring_city(prng)
	# Equivalence classes:
	# prng = valid random object -> randomly returns a value from the neighbors array
	# Tests if successfully returns the first element of the city neighbors array
	def test_get_city
		c = City.new(0,0,'city',0,[1])
		mocked_random = Minitest::Mock.new("mocked random")
		def mocked_random.rand(x); 0; end
		assert_equal(1,c.get_neighboring_city(mocked_random))
	end

	# UNIT TESTS FOR METHOD get_rubies(prng)
	# Equivalence classes:
	# prng = valid random object -> returns an array of a random amount of rubies(with some constriants)
	# Tests if returns valid array
	def test_zero_rubies
		c = City.new(1,1,'city',0,[])
		mocked_random = Minitest::Mock.new("mocked random")
		def mocked_random.rand(x); 0; end
		assert_equal([0,0],c.get_rubies(mocked_random))
	end

	# Tests if returns correct array with max rubies for city
	def test_max_rubies
		c = City.new(1,1,'city',0,[])
		mocked_random = Minitest::Mock.new("mocked random")
		def mocked_random.rand(x); 1; end
		assert_equal([1,1],c.get_rubies(mocked_random))
	end
end
