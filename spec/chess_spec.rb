# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require_relative '../lib/chess.rb'

describe Chess do
  subject(:chess) { described_class.new }

  describe '#move_piece' do
    context 'from the starting setup' do
      it 'pawn can move from d2 to d3' do
        chess.setup_pieces
        expect(chess.move_piece([3, 1], [3, 2])).to be true
      end

      it 'pawn can move from a2 to a4' do
        chess.setup_pieces
        expect(chess.move_piece([0, 1], [0, 3])).to be true
      end

      it 'pawn cannot move from d2 to e3' do
        chess.setup_pieces
        expect(chess.move_piece([3, 1], [4, 2])).to be false
      end

      it 'pawn cannot move from e2 to e5' do
        chess.setup_pieces
        expect(chess.move_piece([4, 1], [4, 4])).to be false
      end
    end

    context 'when a pawn on d4 is facing enemy pawns on c5, d5, and e5' do
      it 'pawn can capture on c5' do
        fen = String.new('rnbqkbnr/pppppppp/8/2ppp3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        # chess.print_board
        expect(chess.move_piece([3, 3], [2, 4])).to be true
      end

      it 'pawn cannot move on d5' do
        fen = String.new('rnbqkbnr/pppppppp/8/2ppp3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.move_piece([3, 3], [3, 4])).to be false
      end
    end

    context 'when the a2 pawn is missing' do
      it 'rook a1 can move to a4' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.move_piece([0, 0], [0, 3])).to be true
      end

      it 'rook a1 can capture on a7' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.move_piece([0, 0], [0, 6])).to be true
      end

      it 'rook a1 cannot move to a8' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.move_piece([0, 0], [0, 7])).to be false
      end

      it 'rook a1 cannot move to b1' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.move_piece([0, 0], [1, 0])).to be false
      end

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
