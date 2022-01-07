# frozen_string_literal: true

require_relative 'default_board_layout'

# chess board that hold Pieces, moves pieces, and evaluates positions
class Gameboard
  include DefaultBoardLayout

  attr_reader :board

  def initialize
    # first level array are files a-h
    # second level arrays are ranks 1-8
    @board = Array.new(8, Array.new(8, nil))
    @player1 = :Fixme
    @player2 = :Fixme
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def add_default_pieces
    # add pieces (black)
    DefaultBoardLayout.constants.each do |sym|
      DefaultBoardLayout.const_get(sym).each do |xy|
        @board[xy[0]][xy[1]] = PieceFactory.create_piece(sym, 'black')
      end
    end

    @board.map!(&:reverse)

    # add pieces (white)
    DefaultBoardLayout.constants.each do |sym|
      DefaultBoardLayout.const_get(sym).each do |xy|
        @board[xy[0]][xy[1]] = PieceFactory.create_piece(sym, 'white')
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def check?; end
end
