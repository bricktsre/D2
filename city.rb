# object represents one city
class City
  attr_reader :neighbors, :max_rubies, :max_fake_rubies, :name, :id

  def initialize(mxr, mxfr, name, id, neighbors)
    @max_rubies = mxr
    @max_fake_rubies = mxfr
    @name = name
    @id = id
    @neighbors = neighbors
  end

  # Returns an id of a nieghboring city
  # can return the id of city object method is called with
  # prng must be a valid Random object
  def get_neighboring_city(prng)
    neighbors[prng.rand(neighbors.size)]
  end

  # Returns an array of rubies and fake rubies
  # Rubies and fake rubies are randomly generated
  # between 0 and the max for the city
  def get_rubies(prng)
    rubies = [2]
    rubies[0] = prng.rand(@max_rubies + 1)
    rubies[1] = prng.rand(@max_fake_rubies + 1)
    rubies
  end
end
