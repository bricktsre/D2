# this class represents a miner object
class Miner
  attr_reader :fake_rubies, :rubies, :current_city

  # Initializes the miner object
  # Ruby counts always start at zero
  # starting city is passed in as a parameter
  def initialize(starting_city)
    @fake_rubies = 0
    @rubies = 0
    @current_city = starting_city
  end

  # Increases the ruby counts by zero or more rubies
  # fake and real should be greater or equal to zero
  def increase_rubies(fake, real)
    return nil unless fake.is_a?(Integer) && real.is_a?(Integer) && fake >= 0 && real >= 0

    @fake_rubies += fake
    @rubies += real
  end

  # Changes the city the miner is in
  # city_id is a integer greater than or equal to zero
  # and corresponds to a city on the map
  def change_city(city_id)
    return nil unless city_id.is_a?(Integer) && city_id >= 0

    @current_city = city_id
  end
end
