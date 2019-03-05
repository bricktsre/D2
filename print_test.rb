require 'minitest/autorun'
require_relative 'print'

class Print_test < Minitest::Test

	# UNIT TESTS FOR METHOD one_type_is_zero?(x)
	# Succes Cases: if x[0] or x[1] is zero
	# Failure Cases: x[0] and x[1] are not both not zero
	# Tests if returns true if one is zero
	def test_one_element_is_zero
		p = Print.new
		assert(p.one_type_is_zero?([1,0]))
	end
	
	# Tests if returns false if both are not zero
	def test_neither_element_is_zero
		p = Print.new
		refute(p.one_type_is_zero?([1,1]))
	end

	# UNIT TESTS FOR METHOD print_one_type(x, y)
	# Equivalence classes:
	# x[1] = 0 -> prints ruby or rubies found at city y
	# x[0] = 0 -> prints fake ruby or fake rubies found at city y
	# Tests if prints singular ruby noun when passed in 1 ruby and 0 fake rubies
	def test_print_singular_ruby
		p = Print.new
		assert_output("\tFound 1 ruby in Town.\n") {p.print_one_type([1,0],'Town')}
	end

	# Tests if prints plural ruby noun when passed in 2 ruby and 0 fake rubies
	def test_print_plural_ruby
		p = Print.new
		assert_output("\tFound 2 rubies in Town.\n") {p.print_one_type([2,0],'Town')}
	end

	# Tests if prints singular fake ruby noun when passed in 0 ruby and 1 fake rubies
	def test_print_singular_fake_ruby
		p = Print.new
		assert_output("\tFound 1 fake ruby in Town.\n") {p.print_one_type([0,1],'Town')}
	end

	# Tests if prints plural fake ruby noun when passed in 0 ruby and 2 fake rubies
	def test_print_plural_fake_ruby
		p = Print.new
		assert_output("\tFound 2 fake rubies in Town.\n") {p.print_one_type([0,2],'Town')}
	end
	
	# UNIT TESTS FOR METHOD singular_or_plural(x, y)
	# Equivalence classes:
	# y = 'rubies' x != 1 -> return 'rubies'
	# y = 'rubies' x ==1 -> return 'ruby'
	# y != 'rubies' x != 1 -> return 'fake rubies'
	# y != 'rubies' x == 1 -> return 'fake ruby'
	# Tests if 'rubies' is returned for arguments (0,'rubies')
	def test_plural_ruby
		p = Print.new
		assert_equal('rubies',p.singular_or_plural(0,'rubies'))
	end

	# Tests if 'ruby' is returned for arguments (1,'rubies')
	def test_singular_ruby
		p = Print.new
		assert_equal('ruby',p.singular_or_plural(1,'rubies'))
	end
	
	# Tests if 'fake rubies' is returned for arguments (0,'fake')
	def test_plural_fake_ruby
		p = Print.new
		assert_equal('fake rubies',p.singular_or_plural(0,'fake'))
	end
	
	# Tests if 'fake ruby' is returned for arguments (1,'fake')
	def test_singular_fake_ruby
		p = Print.new
		assert_equal('fake ruby',p.singular_or_plural(1,'fake'))
	end

	# UNIT TESTS FOR METHOD print_both_types(x, y)
	# prints how many rubies and fake rubies were found at city y
	# uses correct singular and plural nouns
	# Tests if correctly prints with both singular
	def test_print_both_singular
		p = Print.new
		assert_output("\tFound 1 ruby and 1 fake ruby in Town.\n") {p.print_both_types([1,1],'Town')}
	end
	
	# Tests if correctly prints with both plural
	def test_print_both_plural
		p = Print.new
		assert_output("\tFound 2 rubies and 2 fake rubies in Town.\n") {p.print_both_types([2,2],'Town')}
	end

	# Tests if correctly prints one singular and one plural
	def test_print_one_singular_one_plural
		p = Print.new
		assert_output("\tFound 1 ruby and 2 fake rubies in Town.\n") {p.print_both_types([1,2],'Town')}
	end

	# UNIT TESTS FOR METHOD print_day(x , y)
	# x[0] and x[1] == 0 -> print found no rubies of either kind
	# x[0] or x[1] == 0 -> print found whatever type none zero
	# x[0] and x[1] != -> print found some of both types
	# Test if prints no rubies of either type found if x.sum ==0
	def test_found_no_rubies
		p = Print.new
		assert_output("\tFound no rubies or fake rubies in Town.\n") {p.print_day([0,0],'Town')}
	end
	
	# Tests if correctly prints found some of both types of x[0]>0 and x[1]>0
	def test_print_some_both_types
		p = Print.new
		assert_output("\tFound 1 ruby and 2 fake rubies in Town.\n") {p.print_day([1,2],'Town')}
	end
	
	# Tests if correctly prints just found rubies if x[1]==1 and x[0]==0
	def test_print_one_type
		p = Print.new
		assert_output("\tFound 1 ruby in Town.\n") {p.print_day([1,0],'Town')}
	end

	# UNIT TESTS FOR METHOD print_game_win_or_lose(x)
	# Equivalence classes:
	# x = 0 -> print 'Going home empty-handed.'
	# x = 1..9 -> print 'Going home sad.'
	# x = 10...infinity -> print 'Going home victorious.'
	# Tests if prints empty-handed if x is 0
	def test_empty_handed
		p = Print.new
		assert_output("Going home empty-handed.\n") {p.print_game_win_or_lose(0)}
	end

	# Tests if prints sad if x is 3
	def test_sad
		p = Print.new
		assert_output("Going home sad.\n") {p.print_game_win_or_lose(3)}
	end
	
	# Tests if prints victorious if x is 10
	def test_barely_victorious
		p = Print.new
		assert_output("Going home victorious!\n") {p.print_game_win_or_lose(10)}
	end
	
	# Tests if prints victorious if x is 15
	def test_victorious
		p = Print.new
		assert_output("Going home victorious!\n") {p.print_game_win_or_lose(16)}
	end

	# UNIT TESTS FOR METHOD print_trip(x)
 	# prints out results of miner's trip
	# Tests if prints out correctly
        def test_trip
                p = Print.new
                assert_output("After 23 days, Rubyist 1 found:\n\t5 rubies.\n\t7 fake rubies.\nGoing home sad.\n") {p.print_trip([5,7],23,1)}
        end

end
