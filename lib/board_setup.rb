# frozen_string_literal: true

# used by gameboard for initial piece setup
# hoping to add more variants later
module BoardSetup
  STANDARD_SETUP = {
    queen: [[3, 0]].freeze,
    king: [[4, 0]].freeze,
    rook: [[0, 0], [7, 0]].freeze,
    knight: [[1, 0], [6, 0]].freeze,
    bishop: [[2, 0], [5, 0]].freeze,
    pawn: [[0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1]].freeze
  }.freeze
end
