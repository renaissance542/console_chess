# frozen_string_literal: true

require_relative '../moves/move'
require_relative 'piece'

# bishop for chess game
class Bishop < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, -1], [1, 1],
      [-1, -1], [-1, 1]
    ].map { |xy| MoveOrCapture.new(xy, true) }
  end

  def to_s
    color == :white ? 'B' : 'b'
  end
end
