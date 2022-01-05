# frozen_string_literal: true

require_relative 'move'

# knight for chess game, moves L shape
class Knight
  def initialize(color)
    super(color)
    @moves = [
      Move.new(1, 2),
      Move.new(1, -2),
      Move.new(-1, 2),
      Move.new(-1, -2),
      Move.new(2, 1),
      Move.new(2, -1),
      Move.new(-2, 1),
      Move.new(-2, -1)
    ]
  end

  # accepts a square of the board
  # returns an array of squares that are legal knight moves
  def legal_moves(square)
    result = @moves.map do |move|
      new_move = []
      new_move.push(move[0] + square [0])
      new_move.push(move[1] + square [1])
      new_move
    end
    result.filter { |move| (move[0].between?(0, 7) && move[1].between?(0, 7)) }
  end
end