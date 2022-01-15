# frozen_string_literal: true

require_relative 'board_setup'
require_relative '../lib/pieces/piece_factory'

# chess board that hold Pieces, moves pieces, and evaluates positions
class Gameboard
  attr_reader :board

  def initialize
    # board is array of columns (files a - h)
    # each column is an array of squares (ranks 1 - 8)
    @board = Array.new(8) { Array.new(8, nil) }
  end

  def setup_pieces
    fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
    load_fen(fen)
  end

  def get_piece(square)
    @board[square[0]][square[1]]
  end

  # rubocop:disable all
  # use a FEN file to set up the board
  # below is sample FEN
  # 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
  def load_fen(fen)
    fen_parts = fen.split
    # loop through the board by rank
    (0..7).reverse_each do |rank|
      file = 0
      while file <= 7
        char = fen_parts[0].slice!(0)
        # if character than place piece
        if char.match?(/[[:alpha:]]/)
          @board[file][rank] = PieceFactory.create_piece(char)
        end
        file = file + char.to_i + 1
      end
      fen_parts[0].slice!(0) # remove the '/'
    end
    # set @active_color
    # castling availability
    # en passant target in algebraic
    # halfmove clock for 50 move rule
    # fullmove number, incremented after black's turn
  end

  private

end
