# frozen_string_literal: true

# input and output to console for chess game
class ConsoleUI
  def print_board(board)
    line = String.new
    (0..7).reverse_each do |rank|
      board.each do |column|
        square = column[rank] || 'O'
        line << square.to_s
      end
      line << "\n"
    end
    puts line
  end
end
