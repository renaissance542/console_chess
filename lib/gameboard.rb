# frozen_string_literal: true

# chess board that holds, adds, or removes pieces
class Gameboard
  attr_reader :board

  def initialize
    # board is array of columns (files a - h)
    # each column is an array of squares (ranks 1 - 8)
    @board = Array.new(8) { Array.new(8, nil) }
  end

  def get_piece(coordinate)
    @board[coordinate[0]][coordinate[1]]
  end

  def set_piece(file, rank, piece)
    @board[file][rank] = piece
  end
end
