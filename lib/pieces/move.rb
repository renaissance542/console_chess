# frozen_string_literal:true

# how a chess piece can move
class Move
  def initialize(x:, y:, type:, repeat: false)
    # rubocop:disable Naming/MethodParameterName
    @x = x
    @y = y
    @repeat = repeat
    @type = type # move_only, capture_only, move_or_capture, en_passant, castle
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
