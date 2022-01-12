# frozen_string_literal: true

require_relative 'board_setup'
require_relative '../lib/pieces/piece_factory'

# chess board that hold Pieces, moves pieces, and evaluates positions
class Gameboard
  include BoardSetup

  attr_reader :board

  def initialize
    # board is array of columns (files a - h)
    # each column is an array of squares (ranks 1 - 8)
    @board = Array.new(8) { Array.new(8, nil) }
  end

  def setup_pieces
    setup_one_side(:black)
    @board.map!(&:reverse)
    setup_one_side(:white)
  end

  def get_piece(square)
    @board[square[0]][square[1]]
  end

  private

  def setup_one_side(color)
    STANDARD_SETUP.each_pair do |piece, squares|
      squares.each do |xy|
        @board[xy[0]][xy[1]] = PieceFactory.create_piece(piece, color)
      end
    end
  end

  def check?; end
end
