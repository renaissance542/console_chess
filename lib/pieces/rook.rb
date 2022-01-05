# frozen_string_literal: true

require_relative 'move'

# rook for chess game
class Rook < Piece
  attr_reader :moves
  def initialize(color)
    super(color)
    @moves = [
      Move.new(1, 0, true),
      Move.new(-1, 0, true),
      Move.new(0, 1, true),
      Move.new(0, -1, true)
    ]
  end
end