class Backpack
  attr_reader :contents
  def initialize(contents)
    @contents = contents || {}
  end

  def add_pokemon(pokemon_id)
    contents[pokemon_id.to_s] ||= 0
    contents[pokemon_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(pokemon_id)
    contents[pokemon_id.to_s]
  end
end
