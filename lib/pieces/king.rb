# frozen_string_literal: true

require_relative '../moves/move'
require_relative 'piece'

# king for chess game
class King < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, -1], [1, 0], [1, 1],
      [0, -1], [0, 1],
      [-1, -1], [-1, 0], [-1, 1]
    ].map { |xy| MoveOrCapture.new(xy, false) }
  end

  def to_s
    color == :white ? 'K' : 'k'
  end
end
