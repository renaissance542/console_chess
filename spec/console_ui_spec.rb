# frozen_string_literal: true

require_relative '../lib/console_ui'
require_relative '../lib/gameboard'

describe ConsoleUI do
  subject(:console) { described_class.new }
  

  describe '#print_board' do
    it 'prints the damn board' do
      board = Gameboard.new
      board.setup_pieces
      console.print_board(board.board)
    end

  end
end
