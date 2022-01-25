# frozen_string_literal:true

# how a chess piece can move
class Coordinate

  # rubocop:disable Naming/MethodParameterName
  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def add(point)
    new_x = @x + point.x
    new_y = @y + point.y
    Point.new(new_x, new_y)
  end

  def alg_to_indices(algebraic)
    file = algebraic[0].ord - 97
    rank = algebraic[1].to_i - 1
    [file, rank]
  end
  
  # irb(main):006:0> bar = [-1, -3]
  # => [-1, -3]
  # irb(main):007:0> arr
  # => [4, 5]
  # irb(main):008:0> arr + bar
  # => [4, 5, -1, -3]
  # irb(main):010:0> [arr, bar].transpose.map(&:sum)
  # => [3, 2]
end
