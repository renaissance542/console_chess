# frozen_string_literal: true

require_relative '../lib/console_ui'
require_relative '../lib/gamedata'

describe ConsoleUI do
  subject(:console) { described_class.new }

  describe '#print_board' do
    it 'prints the starting board correctly' do
      gamedata = Gamedata.new
      fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
      gamedata.load_fen(fen)
      output = "rnbqkbnr\npppppppp\n--------\n--------\n--------\n--------\nPPPPPPPP\nRNBQKBNR\n"
      expect($stdout).to receive(:puts).with(output)
      console.print_board(gamedata.gameboard.board)
    end
  end
end
