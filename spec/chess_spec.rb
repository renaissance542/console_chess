# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require_relative '../lib/chess.rb'

describe Chess do
  subject(:chess) { described_class.new }

  describe '#get_moves' do
    context 'when a pawn is unobstructed on [3, 1] (d1)' do
      it 'returns [[3, 2], [3, 3]]  (d3 and d4)' do
        moves = [[3, 2], [3, 3]]
        chess.setup_pieces
        expect(chess.get_moves([3, 1])).to eq(moves)
      end
    end
  end

end