# frozen_string_literal: true

require_relative '../../lib/pieces/knight.rb'

describe Knight do
  subject(:knight) { described_class.new('white') }
  @board = Array.new(8) { Array.new(8, nil) }
  @board[1][0] = Knight.new('white')

  # describe '#legal_move?' do
  #   it 'returns true to move from b1 to c3' do
  #     expect(knight.legal_move?(@board, 'b1', 'c3')).to be true
  #   end
  # end
end
