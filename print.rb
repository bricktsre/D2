# Prints out information
class Print
  def print_day(counts, city)
    if counts.sum.zero?
      puts "\tFound no rubies or fake rubies in #{city}."
    elsif one_type_is_zero?(counts)
      print_one_type(counts, city)
    else
      print_both_types(counts, city)
    end
  end

  def one_type_is_zero?(counts)
    return true if (counts[0].zero? || counts[1].zero?) && !counts.sum.zero?

    false
  end

  def print_one_type(counts, city)
    if counts[1].zero?
      noun = singular_or_plural(counts[0], 'rubies')
      puts "\tFound #{counts[0]} #{noun} in #{city}."
      return
    end
    noun = singular_or_plural(counts[1], 'fake')
    puts "\tFound #{counts[1]} #{noun} in #{city}."
  end

  def print_both_types(counts, city)
    noun1 = singular_or_plural(counts[0], 'rubies')
    noun2 = singular_or_plural(counts[1], 'fake')
    puts "\tFound #{counts[0]} #{noun1} and #{counts[1]} #{noun2} in #{city}."
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
    print "After #{days} days, Rubyist #{num_miner} found:"
    puts "\n\t#{counts[0]} #{noun1}.\n\t#{counts[1]} #{noun2}."
    print_game_win_or_lose(counts[0])
  end

  def print_game_win_or_lose(rubies)
    case rubies
    when 0
      puts 'Going home empty-handed.'
    when 1..9
      puts 'Going home sad.'
    else
      puts 'Going home victorious!'
    end
  end
end
