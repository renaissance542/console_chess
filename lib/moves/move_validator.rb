# frozen_string_literal: true

module MoveValidator
  # conditionals corresponding to each Move type

  def captures?(target)
    # target piece == opponent's color
  end

  def moves?(target)
    @gameboard.get_piece(target).nil?
  end
 
  # moveORcapture: target != own piece

  def double_move?(target)
    # this is hard and should be delayed
  end

  # start_square + move = next_square
  MOVE_CONDITIONS = {
    move: proc { |next_square| next_square.nil? },
    capture: proc { |next_square| !next_square.nil? },
    move_or_capture: proc { |next_square| @gamedata.gameboard.get_piece(next_square).color != :white },
    double_move: proc { |next_square| next_square[1] == 3 },
    en_passant: {},
    castle: {}
  }.freeze

  # def en_passant?(target)
  #   target piece == opponent.color && target == @enpassent
  # end
  # enpassant: target == enpassant target
  # castling: target castling right present, king squares clear and not checked
  # double: white on rank 2, black on rank 7
  # repeat: loop the move until off board or hit piece
  # resulting position (new gameboard) own king not in check


end
