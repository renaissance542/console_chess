# frozen_string_literal: true

require_relative '../lib/console_ui'
require_relative '../lib/gameboard'

describe ConsoleUI do
  subject(:console) { described_class.new }
  

  describe '#print_board' do
    it 'prints the starting board' do
      board = Gameboard.new
      fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
      board.load_fen(fen)
      console.print_board(board.board)
    end

  end
end
