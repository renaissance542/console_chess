# frozen_string_literal: true

require_relative 'move'
require_relative 'piece'

# pawn for chess game
class Pawn < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, 0], # move forward
      [1, -1], [1, 1], # capture forward & en passant
      [2, 0] # double move
    ].map { |xy| Move.new(x: xy[0], y: xy[1]) }
  end

  def to_s
    'P'
  end
end
