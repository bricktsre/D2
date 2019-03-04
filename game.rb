require_relative 'miner'
require_relative 'city'

# This class runs the game
class Game
  def initialize(seed, num_miner, num_turns)
    @num_turns = num_turns
    @prng = Random.new(seed)
    @miner_array = initialize_miners(num_miner)
    @city_array = initialize_cities
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
      turns_taken = 0
      days = 0
      while turns_taken < @num_turns
        rubies = one_day(miner)
        day += 1
        if rubies.sum.zero?
          turns_taken += 1
          break if turns_taken == @num_turns

          change_cities(miner, @city_array)
        end
      end
      print_miner_trip([miner.rubies, miner.fake_rubies], days, num_miners)
      num_miners += 1
    end
  end

  def one_day(miner)
    rubies = @city_array[miner.current_city].get_rubies(@prng)
    miner.increase_rubies(rubies)
    print_day(rubies, miner)
    rubies
  end

  def change_cities(miner, cities)
    old_city = miner.current_city
    miner.change_city(cities[old_city].get_neighboring_city(@prng))
    new_city = cities[miner.current_city].name
    puts "Heading from #{cities[old_city].name} to #{new_city}."
    miner.current_city
  end

  def print_day(counts, miner)
    city = @city_array[miner.current_city].name
    puts "\tFound no rubies or fake rubies in #{city}." if ruby_counts.sum.zero?
    one_type(ruby_counts[0], city) if one_type_is_zero?(counts)
    print_both_types(ruby_counts, city)
  end

  def one_type_is_zero?(counts)
    return true if counts[0].zero? || counts[1].zero?

    false
  end

  def one_type(counts, city)
    if counts[1].zero?
      noun = singular_or_plural(counts[0], 'rubies')
      puts "\tFound #{counts[0]} #{noun} in #{city}."
    end
    noun = singular_or_plural(counts[0], 'fake')
    puts "\tFound #{counts[1]} #{noun} in #{city}."
  end

  def print_both_types(counts, city)
    noun1 = singular_or_plural(counts[0], 'rubies')
    noun2 = singular_or_plural(counts[1], 'fake')
    puts "\tFound #{counts[0]} #{noun1puts "\tFound #{counts[0]} #{noun} in #{city}."} and #{counts[1]} #{noun2} in #{city}."
  end

  def singular_or_plural(count, type)
    if type == 'rubies'
      return 'rubies' if count != 1

      return 'ruby'
    end
    return 'fake rubies' if count != 1

    'fake ruby'
  end

  def print_trip(counts, days, num_miner)
    noun1 = singular_or_plural(counts[0], 'rubies')
    noun2 = singular_or_plural(counts[1], 'fake')
    puts "After #{days}, Rubyist #{num_miner} found:
    \t#{counts[0]} #{noun1}.
    \t#{counts[1]} #{noun2}."
    print_game_win_or_lose(counts[0])
  end

  def print_game_win_or_lose(rubies)
    case rubies
    when 0
      puts 'Going home empty-handed.'
    when 1..9
      puts 'Going home sad.'
    else
      puts 'Going home victorious'
    end
  end
end
