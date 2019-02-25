require 'minitest/autorun'
require_relative 'city'

class City_test < Minitest::Test
	
	# UNIT TESTS FOR METHOD add_neighbor(x)
	# Equivalence classes:
	# x = -infinity..-1 -> nothing happens(returns nil)
	# x = 0....infinity -> x is added to the neighbors array
	# x = (not a number) return nil and nothing happens
	# x already in neighbors array it should not be added again
	def test_add_positive_id
		c = City.new(0,0,'city',0)
		c.add_neighbor(1)
		assert_includes(c.neighbors,0)
		assert_includes(c.neighbors,1)
	end

	def test_add_string
		c = City.new(0,0,'city',0)
		c.add_neighbor('town')
		assert_includes(c.neighbors,0)
		assert_equal(1,c.neighbors.size)
	end

	def test_add_duplicate_neighbor
		c = City.new(0,0,'city',0)
		c.add_neighbor(0)
		assert_includes(c.neighbors,0)
		assert_equal(1,c.neighbors.size)
	end
	
	# UNIT TESTS FOR METHOD get_neighboring_city(prng)
	# Equivalence classes:
	# prng = valid random object -> randomly returns a value from the neighbors array
	# prng = not a valid random object -> returns nil
	def test_get_city_valid_random
		c = City.new(0,0,'city',0)
		c.add_neighbor(1)
		mocked_random = Minitest::Mock.new("mocked random")

                # Note that rand expects an argument.  rand() is not the same as rand(x)
		def mocked_random.rand(x); 1; end
                # Additionally stub is_a?(x) to always return true
                def mocked_random.is_a?(x); true; end

                # This is not necessary - it has already been stubbed out and we know it is
                # going to be called (cyclomatic complexity of method is 1, easy to determine)
                # so a regular ol' stub makes more sense
		# mocked_random.expect :rand, 1
		assert_equal(1,c.get_neighboring_city(mocked_random))
		assert_mock(mocked_random)
	end

end
