require 'minitest/autorun'
require_relative 'check'

class Check_test < Minitest::Test

	# UNIT TESTS FOR METHOD check_arguments(args)
	# Checks if program arguments are valid
	# SUCCESS CASES: All arguments are present and are valid
	# FAILURE CASES: Arguments are missing
	# 		 Arguments can not be turned into integers
	# Tests if returns true if all arguments are valid
	def test_three_valid_arguments
		c = Check.new
		assert c.check_arguments([1,1,1])
	end

	# Tests if returns false if an argument is missing
	def test_two_valid_arguments
		c = Check.new
		refute c.check_arguments([1,1])
	end

	# Tests if returns false if an argument other than the first is negative
	def test_negative_argument
		c = Check.new
		refute c.check_arguments([1,1,-2])
	end

	# Tests if returns true if an argument is a string that can be converted to
	# an integer
	def test_string_argument
		c = Check.new
		assert c.check_arguments([1,'1',1])
	end

	# Tests if returns true if an argument is a double
	def test_double_argument
		c = Check.new
		assert c.check_arguments([1,1.2,1])
	end

	# Tests if returns false if an argument is a string that cannot be converted
	# to an integer 
	def test_missing_argument_invalid_argument
		c = Check.new
		refute c.check_arguments([1,1,'s'])
	end
end
