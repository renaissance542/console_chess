# frozen_string_literal: true

require_relative 'default_board_layout'

# chess board that hold Pieces, moves pieces, and evaluates positions
class Gameboard
  include DefaultBoardLayout

  def initialize
    # first level array are files a-h
    # second level arrays are ranks 1-8
    @board = Array.new(8, Array.new(8, nil))
    @player1 = :Fixme
    @player2 = :Fixme
  end

  def add_default_pieces
    # add pieces (black)
    @board.map!(&:reverse)
    # add pieces (white)
  end

  def check?; end
end
