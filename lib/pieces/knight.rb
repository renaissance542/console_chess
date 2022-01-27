  # frozen_string_literal: true

require_relative '../moves/move_or_capture'
require_relative 'piece'

# knight for chess game, moves L shape
class Knight < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1]
    ].map { |xy| MoveOrCapture.new(xy, false) }
  end

  def to_s
    color == :white ? 'N' : 'n'
  end
end
