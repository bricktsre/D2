require_relative 'miner'
require_relative 'city'
require_relative 'print'

# This class runs the game
class Game
  def initialize(seed, num_miner, num_turns)
    @num_turns = num_turns
    @prng = Random.new(seed)
    @miner_array = initialize_miners(num_miner)
    @city_array = initialize_cities
    @printer = Print.new
  end

  def initialize_miners(num_miners)
    temp_array = [num_miners]
    (0...num_miners).each { |x| temp_array[x] = Miner.new(0) }
    temp_array
  end

  def initialize_cities
    @city_array = [
      City.new(1, 1, 'Enumerable Canyon', 0, [0, 1, 2]),
      City.new(2, 2, 'Duck Type Beach', 1, [0, 1, 4]),
      City.new(1, 1, 'Monkey Patch City', 2, [0, 2, 3, 4]),
      City.new(0, 3, 'Nil Town', 3, [2, 3, 5]),
      City.new(3, 0, 'Matzburg', 4, [1, 2, 4, 5, 6]),
      City.new(2, 2, 'Hash Crossing', 5, [3, 4, 5, 6]),
      City.new(2, 2, 'Dynamic Palisades', 6, [4, 5, 6])
    ]
  end

  def run
    num_miners = 1
    @miner_array.each do |miner|
      print "Rubyist ##{num_miners} starting in "
      puts "#{@city_array[miner.current_city].name}."
      days = game_loop(miner, @num_turns, @printer, @city_array)
      @printer.print_trip([miner.rubies, miner.fake_rubies], days, num_miners)
      num_miners += 1
    end
  end

  def game_loop(miner, num_turns, printer, city_array)
    turns_taken = 0
    days = 1
    while turns_taken < num_turns
      rubies = one_day(miner, city_array, printer)
      if rubies.sum.zero?
        turns_taken += 1
        break if turns_taken == num_turns

        change_cities(miner, city_array)
      end
      days += 1
    end
    days
  end

  def one_day(miner, city_array, printer)
    rubies = city_array[miner.current_city].get_rubies(@prng)
    miner.increase_rubies(rubies[0], rubies[1])
    printer.print_day(rubies, city_array[miner.current_city].name)
    rubies
  end

  def change_cities(miner, cities)
    old_city = miner.current_city
    miner.change_city(cities[old_city].get_neighboring_city(@prng))
    new_city = cities[miner.current_city].name
    puts "Heading from #{cities[old_city].name} to #{new_city}."
    miner.current_city
  end
end
