# frozen_string_literal: true

require_relative 'king'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative 'rook'

# generate a chess piece
class PieceFactory
  # rubocop:disable Metrics/MethodLength
  def self.create_piece(type, color)
    case type
    when :ROOK
      Rook.new(color)
    when :PAWN
      Pawn.new(color)
    when :BISHOP
      Bishop.new(color)
    when :KNIGHT
      Knight.new(color)
    when :KING
      King.new(color)
    when :QUEEN
      Queen.new(color)
    else
      raise(ArgumentError, 'invalid chess piece type')
    end
  end
  # rubocop:enable Metrics/MethodLength
end
