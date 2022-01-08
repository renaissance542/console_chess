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

  # rubocop:disable all
  def add_default_pieces
    # add_pieces (black)
    STANDARD_SETUP.each_pair do |piece, squares|
      squares.each do |xy|
        @board[xy[0]][xy[1]] = PieceFactory.create_piece(piece, 'black')
      end
    end

    @board.map!(&:reverse)

    # add pieces (white)
    STANDARD_SETUP.each_pair do |piece, squares|
      squares.each do |xy|
        @board[xy[0]][xy[1]] = PieceFactory.create_piece(piece, 'white')
      end
    end
  end
  # rubocop:enable all

  def check?; end
end
