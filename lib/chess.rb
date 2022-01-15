# frozen_string_literal: true

require_relative 'gameboard'
require_relative 'console_ui'

# classical variant of chess
class Chess
  def initialize
    @gameboard = Gameboard.new
    # @ui = ConsoleUI.new
    # @castling = 'KQkq'
    # @en_passant = '-'
    # @PGN = nil
  end

  def setup_pieces
    fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
    @gameboard.load_fen(fen)
  end

  def print_board
    @ui.print_board(@gameboard.board)
  end

  # rubocop:disable all
  def get_moves(square)
    # determine what piece is selected
    piece = @gameboard.get_piece(square)
    return false if piece.nil?

    # build an array of moves
    valid_squares = []

    next_square = [square, [0, 1]].transpose.map(&:sum)
    valid_squares << next_square if @gameboard.get_piece(next_square).nil?

    next_square = [square, [0, 2]].transpose.map(&:sum)
    valid_squares << next_square if @gameboard.get_piece(next_square).nil?

    next_square = [square, [-1, 1]].transpose.map(&:sum)
    valid_squares << next_square unless @gameboard.get_piece(next_square).nil?

    next_square = [square, [1, 1]].transpose.map(&:sum)
    valid_squares << next_square unless @gameboard.get_piece(next_square).nil?

    # subtract out self-checks

    # check if destination is in legal moves
    valid_squares
  end

  def alg_to_indices(algebraic)
    file = algebraic[0].ord - 97
    rank = algebraic[1].to_i - 1
    [file, rank]
  end


  def save_game
    # write FEN to file
  end

  def load_game
    # read FEN from file
  end
end
