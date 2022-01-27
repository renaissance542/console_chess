# frozen_string_literal: true

require 'pry-byebug'

require_relative 'gameboard'
require_relative 'gamedata'
require_relative 'console_ui'

# classical variant of chess
# manages player information
class Chess
  attr_reader :gamedata

  def initialize
    @gamedata = Gamedata.new
    @ui = ConsoleUI.new
  end

  def setup_pieces(fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'))
    @gamedata.load_fen(fen)
  end

  def print_board
    @ui.print_board(@gamedata.gameboard.board)
  end

  def board
    @gamedata.gameboard.board
  end

  # rubocop:disable all
  # this method does not check for self-checks
  def valid_move?(start_square, target_square, gamedata = @gamedata)
    moving_piece = gamedata.get_piece(start_square)
    return false unless moving_piece

    moving_piece.moves.each do |move|
      next_square = start_square
      loop do
        next_square = add_points(next_square, move.move)
        break unless next_square[0].between?(0, 7) && next_square[1].between?(0, 7)
        target_piece = gamedata.get_piece(next_square)
        if next_square == target_square 
          return true if move.conditions_met?(moving_piece, next_square, target_piece, gamedata)
        end
        break unless move.repeat && target_piece.nil?
      end
    end
    false
  end

  # this can be optimized to only check opponent's color pieces
  def self_check?(gamedata)
    board = gamedata.gameboard.board
    target_square = find_king(board)
    board.each_with_index do |file, i|
      file.each_index do |j|
        return true if valid_move?([i, j], target_square, gamedata)
      end
    end
    false
  end

  def find_king(gameboard)
    index = gameboard.flatten.index do |square| 
      !square.nil? && square.class == King && square.color == :white
    end
    file = index / 8
    rank = index % 8
    [file, rank]
  end

  def add_points(start, move)
    [start, move].transpose.map(&:sum)
  end

  def save_game
    # write FEN to file
  end

  def load_game
    # read FEN from file
  end
end
