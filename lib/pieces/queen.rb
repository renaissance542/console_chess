# frozen_string_literal: true

require_relative '../moves/move'
require_relative 'piece'

# queen for chess game
class Queen < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, -1], [1, 0], [1, 1],
      [0, -1], [0, 1],
      [-1, -1], [-1, 0], [-1, 1]
    ].map { |xy| MoveOrCapture.new(xy, true) }
  end

  def to_s
    color == :white ? 'Q' : 'q'
  end
end
