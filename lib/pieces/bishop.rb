# frozen_string_literal: true

require_relative 'move'
require_relative 'piece'

# bishop for chess game
class Bishop < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    @moves = [
      [1, -1], [1, 1],
      [-1, -1], [-1, 1]
    ].map { |xy| Move.new(x: xy[0], y: xy[1], type: :movecapture, repeat: true) }
  end

  def to_s
    'B'
  end

  def to_s
    'B'
  end
end
