# frozen_string_literal:true

require_relative 'move'

# must through an empty square onto an empty square
class Double < Move
  def conditions_met?(_moving_piece, next_square, target_piece, gamedata)
    skipped_square = [next_square[0], (next_square[1] - (@move[1] / 2))]
    target_piece.nil? && gamedata.get_piece(skipped_square).nil?
  end
end
