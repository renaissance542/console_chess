# frozen_string_literal: true

require_relative 'move'
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
    ].map { |xy| Move.new(x: xy[0], y: xy[1], type: :movecapture, repeat: true) }
  end

  def to_s
    'Q'
  end

  def to_s
    'Q'
  end
end
