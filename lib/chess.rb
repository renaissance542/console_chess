# frozen_string_literal: true

require 'pry-byebug'

require_relative 'gameboard'
require_relative 'gamedata'
require_relative 'console_ui'

# classical variant of chess
# manages player information
class Chess
  def initialize
    @gamedata = Gamedata.new
    @gameboard = Gameboard.new
    @ui = ConsoleUI.new
    # @castling = 'KQkq'
    # @en_passant = '-'
    # @PGN = nil
  end

  def setup_pieces(fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'))
    @gamedata.gameboard.load_fen(fen)
  end

  def print_board
    @ui.print_board(@gamedata.gameboard.board)
  end

  MOVE_CONDITIONS = {
    move: proc { |next_square, gamedata| gamedata.get_piece(next_square).nil? },
    capture: proc { |next_square, gamedata| !gamedata.get_piece(next_square).nil? },
    move_or_capture: proc { |next_square, gamedata| gamedata.get_piece(next_square).color != :white },
    double_move: proc { |next_square| (next_square[1] == 3) },
    en_passant: {},
    castle: {}
  }.freeze

  # rubocop:disable all
  def move_piece(start_square, target_square)
    moving_piece = @gamedata.get_piece(start_square)
    return false unless moving_piece

    moving_piece.moves.each do |move|
      next_square = start_square
      loop do
        next_square = add_points(next_square, move.move)
        target_piece = @gamedata.get_piece(next_square)
        if next_square == target_square 
          return true if move.conditions_met?(moving_piece, next_square, target_piece, @gamedata) && !self_check?
        end
        break unless move.repeat && target_piece.nil?
      end
    end
    false
  end

  def self_check?
    false
  end


  # def get_moves(start_square)
  #   # determine what piece is selected
  #   piece = @gamedata.gameboard.get_piece(start_square)
  #   return false if piece.nil?

  #   # build an array of moves
  #   valid_squares = []
  #   piece.moves.each do |move|
  #     next_square = add_points(start_square, move.move)
  #     valid_squares << next_square if MOVE_CONDITIONS[move.type].call(next_square, @gamedata)
  #   end

  #   # subtract out self-checks

  #   # check if destination is in legal moves
  #   valid_squares
  # end

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
