require 'minitest/autorun'
require_relative 'miner'

class Miner_test < Minitest::Test

	# UNIT TESTS FOR METHOD increase_rubies(x,y)
	# Equivalence classes:
	# x or y = -infinity..-1 -> nothing happens
	# x and y = 0....infinity -> fake_rubies+=x and rubies+=y
	# x or y = (not a number) return nil and nothing happens
	def test_negative_increase
		m = Miner.new(1)
		fr = m.fake_rubies
		r = m.rubies
		m.increase_rubies(-1,-1)
		assert_equal(fr,m.fake_rubies)
		assert_equal(r,m.rubies)
	end

	def test_regular_increase
		m = Miner.new(1)
		fr = m.fake_rubies
		r = m.rubies
		m.increase_rubies(1,1)
		assert_equal(fr+1,m.fake_rubies)
		assert_equal(r+1,m.rubies)
	end

	def test_no_increase
		m = Miner.new(1)
		fr = m.fake_rubies
		r = m.rubies
		m.increase_rubies(0,0)
		assert_equal(fr,m.fake_rubies)
		assert_equal(r,m.rubies)
	end

	def test_increase_string
		m = Miner.new(1)
		fr = m.fake_rubies
		r = m.rubies
		m.increase_rubies(1.45,0.56)
		assert_equal(fr,m.fake_rubies)
		assert_equal(r,m.rubies)
	end

	# UNIT TESTS FOR METHOD change_city(x)
	# Equivalence classes:
	# x = -infinty...-1 -> nothing happens(returns nil)
	# x = 0...infinity -> current_city = x
	# x = not a number -> nothing happens(returns nil)
	def test_negative_change
		m = Miner.new(0)
		old_city = m.current_city
		m.change_city(-1)
		assert_equal(old_city,m.current_city)
	end

	def test_normal_change
		m = Miner.new(0)
		m.change_city(1)
		assert_equal(1,m.current_city)
	end

	def test_string_change
		m = Miner.new(1)
		old_city = m.current_city
		m.change_city('city')
		assert_equal(old_city,m.current_city)
	end
end
