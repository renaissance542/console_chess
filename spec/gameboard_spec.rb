# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require_relative '../lib/gameboard'
require_relative '../lib/pieces/piece_factory'

system("cls") || system("clear")

describe Gameboard  do
  subject(:gameboard) { described_class.new }

  describe '#add_default_pieces' do
    context 'The default set up results in' do

      it '64 total squares' do
        expect(gameboard.board.flatten.length).to eql(64)
      end

      it '32 nil squares' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count(nil)).to eq(32)
      end

      it '16 pawns' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count { |obj| obj.instance_of?(Pawn) }).to eq(16)
      end

      it '16 white pieces' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count do |obj|
          obj && (obj.color == 'white')
        end).to eq(16)
      end

      it '2 kings' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count { |obj| obj.instance_of?(King) }).to eq(2)
      end

      it '2 queens' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count { |obj| obj.instance_of?(Queen) }).to eq(2)
      end

      it '4 knights' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count { |obj| obj.instance_of?(Knight) }).to eq(4)
      end

      it '4 bishops' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count { |obj| obj.instance_of?(Bishop) }).to eq(4)
      end

      it '4 rooks' do
        gameboard.add_default_pieces
        expect(gameboard.board.flatten.count { |obj| obj.instance_of?(Rook) }).to eq(4)
      end
    end


  end
end
