# frozen_string_literal: true

require_relative '../lib/point'

describe Point do
  describe '#self.alg.to.indices' do
    it 'returns [0, 0] for a1' do
      expect(Point.alg_to_indices('a1')).to eq([0, 0])
    end

    it 'returns [7, 7] for h8' do
      expect(Point.alg_to_indices('h8')).to eq([7, 7])
    end
  end
end
