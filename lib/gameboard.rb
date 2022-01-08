# frozen_string_literal: true

require_relative 'board_setup'

# chess board that hold Pieces, moves pieces, and evaluates positions
class Gameboard
  include BoardSetup

  attr_reader :board

  def initialize
    # first level array are files a-h
    # second level arrays are ranks 1-8
    @board = Array.new(8) { Array.new(8, nil) }
    @variant = :Fixme
    @player1 = :Fixme
    @player2 = :Fixme
  end

  def setup_pieces
    setup_one_side('black')
    @board.map!(&:reverse)
    setup_one_side('white')
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
