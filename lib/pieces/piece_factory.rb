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
    when :rook
      Rook.new(color)
    when :pawn
      Pawn.new(color)
    when :bishop
      Bishop.new(color)
    when :knight
      Knight.new(color)
    when :king
      King.new(color)
    when :queen
      Queen.new(color)
    else
      raise(ArgumentError, 'invalid chess piece type')
    end
  end
  # rubocop:enable Metrics/MethodLength
end
