# frozen_string_literal: true

require_relative '../moves/move'
require_relative 'piece'

# rook for chess game
class Rook < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ] # .map { |xy| Move.new(distance: xy, type: :movecapture, repeat: true) }
  end

  def to_s
    color == :white ? 'R' : 'r'
  end
end
