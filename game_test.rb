require 'minitest/autorun'
require_relative 'game'

class Game_test < Minitest::Test

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

	# UNIT TESTS FOR METHOD one_day(m, arr, p)
	# simulates one day of a miner
	# Tests if correctly returns an array of ints
	def test_one_day
		g = Game.new(0,0,0)
		mocked_miner = Minitest::Mock.new("mocked miner")
		def mocked_miner.current_city; 0; end
		def mocked_miner.increase_rubies(x,y); nil; end

		mocked_city = Minitest::Mock.new("mocked city")
		def mocked_city.get_rubies(x); [1,1]; end
		def mocked_city.name; 'Town'; end

		mocked_printer = Minitest::Mock.new("mocked printer")
		def mocked_printer.print_day(x,y); nil; end

		assert_equal([1,1],g.one_day(mocked_miner,[mocked_city],mocked_printer))
	end

	# UNIT TESTS FOR METHOD game_loop(m, num, p, arr)
	# Simulates num turns of miner m
	# Tests game_loop of one day, should return 1
	def test_game_loop
		g = Game.new(0,0,0)
		mocked_miner = Minitest::Mock.new("mocked miner")
		def mocked_miner.current_city; 0; end
		def mocked_miner.increase_rubies(x,y); nil; end
		
		mocked_city = Minitest::Mock.new("mocked city")
		def mocked_city.get_rubies(x); [0,0]; end
		def mocked_city.name; 'Town'; end
	
		mocked_printer = Minitest::Mock.new("mocked printer")
		def mocked_printer.print_day(x,y); nil; end	
		
		assert_equal(1,g.game_loop(mocked_miner, 1 ,mocked_printer, [mocked_city]))
	end

	# Tests if miner changes city when finding no rubies at starting city
	def test_game_loop_change_city
		g = Game.new(0,0,0)
		mocked_miner = Minitest::Mock.new("mocked miner")
		def mocked_miner.current_city; 0; end
		def mocked_miner.increase_rubies(x,y); nil; end
		def mocked_miner.change_city(x); nil; end

		mocked_city = Minitest::Mock.new("mocked city")
		def mocked_city.get_rubies(x); [0,0]; end
		def mocked_city.name; 'Town'; end
		def mocked_city.get_neighboring_city(x); 0; end

		mocked_printer = Minitest::Mock.new("mocked printer")
		def mocked_printer.print_day(x,y); nil; end	
		
		assert_output("Heading from Town to Town.\n") {g.game_loop(mocked_miner, 2, mocked_printer, [mocked_city])}
	end

	# UNIT TESTS FOR METHOD initialize_miners(x)
	# Should create array of miners of size x
	# Tests if created array is of size 2
	def test_initialize_miners
		g = Game.new(0,0,0)
		mocked_miner = Minitest::Mock.new("mocked miner")
		def mocked_miner.new; nil; end

		assert_equal(2, (g.initialize_miners(2)).size)
	end
end
