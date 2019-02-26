require 'minitest/autorun'
require_relative 'city'

class City_test < Minitest::Test
	
	# UNIT TESTS FOR METHOD add_neighbor(x)
	# Equivalence classes:
	# x = 0....infinity -> x is added to the neighbors array
	# x already in neighbors array it should not be added again
	def test_add_positive_id
		c = City.new(0,0,'city',0)
		c.add_neighbor(1)
		assert_includes(c.neighbors,0)
		assert_includes(c.neighbors,1)
	end

	def test_add_duplicate_neighbor
		c = City.new(0,0,'city',0)
		c.add_neighbor(0)
		assert_includes(c.neighbors,0)
		assert_equal(1,c.neighbors.size)
	end

	def test_add_multiple_neighbors
		c = City.new(0,0,'city',0)
		c.add_neighbor(1)
		c.add_neighbor(2)
		assert_equal(3,c.neighbors.size)
		assert_includes(c.neighbors,1)
		assert_includes(c.neighbors,2)
	end

	# UNIT TESTS FOR METHOD get_neighboring_city(prng)
	# Equivalence classes:
	# prng = valid random object -> randomly returns a value from the neighbors array
	def test_get_city_valid_random
		c = City.new(0,0,'city',0)
		c.add_neighbor(1)
		mocked_random = Minitest::Mock.new("mocked random")
		def mocked_random.rand(x); 1; end
		assert_equal(1,c.get_neighboring_city(mocked_random))
	end

end
