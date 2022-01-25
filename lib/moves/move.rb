# frozen_string_literal:true

# how a chess piece can move
class Move
  attr_reader :move, :repeat

  def initialize(move, repeat)
    @move = move
    @repeat = repeat
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
