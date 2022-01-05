# frozen_string_literal:true

# how a chess piece can move
class Move
  def initialize(x:, y:, repeat: false)
    @x = x
    @y = y
    @repeat = repeat
  end
end
