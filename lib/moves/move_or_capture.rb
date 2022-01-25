# frozen_string_literal:true

require_relative 'move'

# must move onto a square occopuied by an enemy
class MoveOrCapture < Move
  def conditions_met?(moving_piece, _next_square, target_piece, _gamedata)
    target_piece.nil? || moving_piece.color != target_piece.color
  end
end
