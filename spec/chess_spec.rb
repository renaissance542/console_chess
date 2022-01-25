# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require_relative '../lib/chess.rb'

describe Chess do
  subject(:chess) { described_class.new }

  describe '#move_piece' do
    it 'returns true to move a pawn from d2 to d3' do
      chess.setup_pieces
      expect(chess.move_piece([3, 1], [3, 2])).to be true
    end

    it 'returns false to move a pawn from d2 to e3' do
      chess.setup_pieces
      expect(chess.move_piece([3, 1], [4, 2])).to be false
    end
  end

  # describe '#get_moves' do
  #   context 'when a pawn is unobstructed on [3, 1] (d1)' do
  #     it 'returns [[3, 2], [3, 3]]  (d3 and d4)' do
  #       moves = [[3, 2], [3, 3]]
  #       chess.setup_pieces
  #       expect(chess.get_moves([3, 1])).to eq(moves)
  #     end
  #   end

  #   context 'when a pawn is obstructed on [3, 3] (d4) and can capture to both sides' do
  #     it 'returns [[2, 4], [4, 4]]  (c5 and e5)' do
  #       moves = [[2, 4], [4, 4]]
  #       fen = String.new('rnbqkbnr/pppppppp/8/2ppp3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1')
  #       chess.setup_pieces(fen)
  #       chess.print_board
  #       expect(chess.get_moves([3, 3])).to eq(moves)
  #     end
  #   end

  # end
end
