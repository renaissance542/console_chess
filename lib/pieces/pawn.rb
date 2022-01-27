# frozen_string_literal: true

require_relative '../moves/moveonly'
require_relative '../moves/capture'
require_relative '../moves/double'
# require_relative '../moves/move_or_capture'
require_relative 'piece'

# pawn for chess game
class Pawn < Piece
  attr_reader :moves

  def initialize(color)
    super(color)
    one = color == :white ? 1 : -1
    two = color == :white ? 2 : -2
    @moves = [
      MoveOnly.new([0, one], false), # move forward
      Double.new([0, two], false), # double
      Capture.new([-1, one], false), # capture forward 
      Capture.new([1, one], false) # capture forward
    ].freeze
  end

  def to_s
    @color == :white ? 'P' : 'p'
  end
end

# move: target.nil?
# capture: target == opponent piece
# move_or_capture: target != own piece
# enpassant: target == enpassant target
# castling: target castling right present, king squares clear and not checked
# double: white on rank 2, black on rank 7
# repeat: loop the move until off board or hit piece
# resulting position (new gameboard) own king not in check
