# frozen_string_literal: true

require_relative 'king'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative 'rook'

# generate a chess piece
class PieceFactory
  PIECES = {
    r: Rook,
    p: Pawn,
    b: Bishop,
    n: Knight,
    k: King,
    q: Queen
  }.freeze

  def self.create_piece(fen_char)
    color = fen_char.ord < 92 ? :white : :black 
    klass = PIECES[fen_char.downcase.to_sym]
    raise(ArgumentError, 'invalid chess piece type') if klass.nil?

    klass.new(color)
  end
end
