# frozen_string_literal: true

require_relative 'move'
require_relative 'piece'

# pawn for chess game
class Pawn < Piece
  MOVES = [
    Move.new(x: 0, y: 1, type: :move, repeat: false), # move forward
    Move.new(x: -1, y: 1, type: :capture, repeat: false), # capture forward & en passant
    Move.new(x: 1, y: 1, type: :capture, repeat: false) # capture forward & en passant
  ].freeze

  def initialize(color)
    super(color)
  end

  def to_s
    'P'
  end

  def to_s
    'P'
  end
end
