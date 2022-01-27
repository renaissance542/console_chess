# frozen_string_literal: true

require_relative 'pieces/piece_factory'

# stores all game instance data
class Gamedata
  attr_reader :gameboard, :castling, :en_passant, :white_player, :black_player,
              :halfmove_count, :fullmove_count

  def initialize
    @gameboard = Gameboard.new
    @active_color = ''
    @castling = ''
    @en_passant = ''
    @halfmove_count = 0
    @fullmove_count = 0
    @white_player = ''
    @black_player = ''
  end

  # rubocop:disable all
  # below is sample FEN for standard setup
  # 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
  def load_fen(fen)
    fen_parts = fen.split
    # loop through the board by rank
    
    (0..7).reverse_each do |rank|
      file = 0
      while file <= 7
        char = fen_parts[0].slice!(0)
        # if character, then place piece
        if char.match?(/[[:alpha:]]/)
          @gameboard.board[file][rank] = PieceFactory.create_piece(char)
        end
        file += 1
        file = (file - 1 + char.to_i) if char.to_i > 0
      end
      fen_parts[0].slice!(0) # remove the '/'
    end
    # TODO: set @active_color
    # TODO: castling availability
    # TODO: en passant target in algebraic
    # TODO: halfmove clock for 50 move rule
    # TODO: fullmove number, incremented after black's turn
  end


  def get_piece(coordinate)
    @gameboard.board[coordinate[0]][coordinate[1]]
  end


  def to_fen; end
end
