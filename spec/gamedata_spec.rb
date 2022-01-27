# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require_relative '../lib/gamedata'

describe Gamedata  do
  subject(:gamedata) { described_class.new }

  describe '#load_fen(fen)' do
    context 'The default set up results in' do

      it '64 total squares' do
        expect(gamedata.gameboard.board.flatten.length).to eql(64)
      end

      it '32 nil squares' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count(nil)).to eq(32)
      end

      it '16 pawns' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count { |obj| obj.instance_of?(Pawn) }).to eq(16)
      end

      it '16 white pieces' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count do |obj|
          obj && (obj.color == :white)
        end).to eq(16)
      end

      it '2 kings' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count { |obj| obj.instance_of?(King) }).to eq(2)
      end

      it '2 queens' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count { |obj| obj.instance_of?(Queen) }).to eq(2)
      end

      it '4 knights' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count { |obj| obj.instance_of?(Knight) }).to eq(4)
      end

      it '4 bishops' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count { |obj| obj.instance_of?(Bishop) }).to eq(4)
      end

      it '4 rooks' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        gamedata.load_fen(fen)
        expect(gamedata.gameboard.board.flatten.count { |obj| obj.instance_of?(Rook) }).to eq(4)
      end
    end
  end

  # describe '#load_fen(fen)' do
  #   it 'fill the board with white pawns' do
  #     gamedata.load_fen(fen)(String.newString.new(('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')))
  #     expect(gameboard.board.flatten.count { |obj| obj.instance_of?(Pawn) }).to eq(64)
  #   end
  # end
end
