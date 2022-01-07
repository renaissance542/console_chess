# frozen_string_literal: true

require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'

# generate a chess piece
class PieceFactory
  # rubocop:disable Metrics/MethodLength
  def self.create_piece(type, color)
    case type
    when 'rook'
      Rook.new(color)
    when 'pawn'
      Pawn.new(color)
    when 'bishop'
      Bishop.new(color)
    when 'knight'
      Knight.new(color)
    when 'king'
      King.new(color)
    when 'queen'
      Queen.new(color)
    else
      raise(ArgumentError, 'invalid chess piece type')
    end
  end
  # rubocop:enable Metrics/MethodLength
end
