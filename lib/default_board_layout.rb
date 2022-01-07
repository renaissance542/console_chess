# frozen_string_literal: true

# use by gameboard to set up the starting pieces
module DefaultBoardLayout
  QUEEN = [[3, 0]].freeze
  KING = [[4, 0]].freeze
  ROOK = [[0, 0], [7, 0]].freeze
  KNIGHT = [[1, 0], [6, 0]].freeze
  BISHOP = [[2, 0], [5, 0]].freeze
  PAWN = [[0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1]].freeze

  def self.piece_positions
    %i[QUEEN KING ROOK KNIGHT BISHOP PAWN]
  end
end
