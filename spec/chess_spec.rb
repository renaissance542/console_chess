# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require_relative '../lib/chess.rb'

describe Chess do
  subject(:chess) { described_class.new }

  describe '#valid_move?' do
    context 'from the starting setup' do
      it 'pawn can move from d2 to d3' do
        chess.setup_pieces
        expect(chess.valid_move?([3, 1], [3, 2])).to be true
      end

      it 'pawn can move from a2 to a4' do
        chess.setup_pieces
        expect(chess.valid_move?([0, 1], [0, 3])).to be true
      end

      it 'pawn cannot move from d2 to e3' do
        chess.setup_pieces
        expect(chess.valid_move?([3, 1], [4, 2])).to be false
      end

      it 'pawn cannot move from e2 to e5' do
        chess.setup_pieces
        expect(chess.valid_move?([4, 1], [4, 4])).to be false
      end

      it 'black pawn can move from e7 to e5' do
        chess.setup_pieces
        expect(chess.valid_move?([4, 6], [4, 4])).to be true
      end

      it 'black pawn can move from g7 to g6' do
        chess.setup_pieces
        expect(chess.valid_move?([6, 6], [6, 5])).to be true
      end

      it 'black pawn cannot move from d7 to d8' do
        chess.setup_pieces
        expect(chess.valid_move?([3, 6], [3, 7])).to be false
      end

      it 'knight can move from b1 to c3' do
        chess.setup_pieces
        expect(chess.valid_move?([1, 0], [2, 2])).to be true
      end

      it 'knight cannot move from b1 to d2' do
        chess.setup_pieces
        expect(chess.valid_move?([1, 0], [3, 1])).to be false
      end

    end

    context 'when a pawn on d4 is facing enemy pawns on c5, d5, and e5' do
      it 'pawn can capture on c5' do
        fen = String.new('rnbqkbnr/pppppppp/8/2ppp3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        # chess.print_board
        expect(chess.valid_move?([3, 3], [2, 4])).to be true
      end

      it 'pawn cannot move on d5' do
        fen = String.new('rnbqkbnr/pppppppp/8/2ppp3/3P4/8/PPP1PPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([3, 3], [3, 4])).to be false
      end
    end

    context 'when pawns are obstructed by pieces' do
      it 'pawns cannot double move to 4th or 6th rank' do
        fen = String.new('rnbqkbnr/pppppppp/PPPPpppp/8/8/PPPPpppp/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([3, 1], [3, 3])).to be false
        expect(chess.valid_move?([5, 1], [5, 3])).to be false
        expect(chess.valid_move?([3, 6], [3, 5])).to be false
        expect(chess.valid_move?([5, 6], [5, 5])).to be false
      end
    end

    context 'when the a2 pawn is missing' do
      it 'rook a1 can move to a4' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([0, 0], [0, 3])).to be true
      end

      it 'rook a1 can capture on a7' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([0, 0], [0, 6])).to be true
      end

      it 'rook a1 cannot move to a8' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([0, 0], [0, 7])).to be false
      end

      it 'rook a1 cannot move to b1' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([0, 0], [1, 0])).to be false
      end

      it 'rook a1 cannot move off the board to the left' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([0, 0], [-1, 0])).to be false
      end

      it 'rook a8 cannot move to a1' do
        fen = String.new('rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR w KQkq - 0 1')
        chess.setup_pieces(fen)
        expect(chess.valid_move?([0, 7], [-0, 0])).to be false
      end
    end
  end

  describe '#find_king' do
    it 'locates white king on e1 on starting board' do
      chess.setup_pieces
      expect(chess.find_king(chess.board)).to eq([4, 0])
    end
  end

  describe '#self_check?' do
    it 'white king is not in check in the starting position' do
      chess.setup_pieces
      expect(chess.self_check?(chess.gamedata)).to be false
    end

    it 'white king is in check from rook on e8' do
      fen = String.new('4r3/8/8/8/8/8/8/RNBQKBNR w KQkq - 0 1')
      chess.setup_pieces(fen)
      expect(chess.self_check?(chess.gamedata)).to be true
    end

    it 'white king is in check from bishop on a5' do
      fen = String.new('8/8/8/b7/8/8/8/RNBQKBNR w KQkq - 0 1')
      chess.setup_pieces(fen)
      expect(chess.self_check?(chess.gamedata)).to be true
    end

    it 'white king is in check from pawn on d2' do
      fen = String.new('8/8/8/8/8/8/3p4/RNBQKBNR w KQkq - 0 1')
      chess.setup_pieces(fen)
      expect(chess.self_check?(chess.gamedata)).to be true
    end
  end
end
