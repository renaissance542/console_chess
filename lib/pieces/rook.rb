# frozen_string_literal: true

# rook for chess game
class Rook < Piece
  attr_reader :moves
  def initialize(color)
    super(color)
    @moves = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  end
end