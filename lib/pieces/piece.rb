# frozen_string_literal: true

# chess piece
class Piece
  attr_reader :color

  def initialize(color)
    @color = color
  end
end
