# object represents one city
class City
  attr_reader :neighbors, :max_rubies, :max_fake_rubies, :name, :id

  def initialize(mxr, mxfr, name, id)
    @max_rubies = mxr
    @max_fake_rubies = mxfr
    @name = name
    @id = id
    @neighbors = [0]
  end

  # Adds a connection to a neighboring city
  # new_id should be a integer greater than zero
  def add_neighbor(new_id)
    return nil unless new_id.is_a?(Integer) && new_id >= 0

    return nil if neighbors.include?(new_id)

    neighbors[neighbors.size] = new_id
  end

  # Returns an id of a nieghboring city
  # can return the id of city object method is called with
  # prng must be a valid Random object
  def get_neighboring_city(prng)
    return nil unless prng.is_a?(Random)

    neighbors[prng.rand(neighbors.size)]
  end
end
