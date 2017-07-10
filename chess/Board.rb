require 'byebug'
require_relative 'Piece.rb'
require 'colorize'

class Board
  attr_accessor :grid

  def initialize(grid = Board.empty_grid)

    @grid = grid
    # @null_piece
    @piece = Piece.new
    # @rook = Rook.new
    # @knight = Knight.new
    # @bishop = Bishop.new
    # @queen = Queen.new
    # @king = King.new
    # @bishop = Bishop.new
    # @knight = Knight.new
    # @rook = Rook.new
    # @pawn = Pawn.new
  end

  def self.empty_grid
    Array.new(8) {Array.new(8)}
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def add_piece(piece, pos)
  end

  def dup()
  end


  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    x, y = pos
    pos.all? {|coord| coord.between?(0, 7)}
  end

  def checkmate?()
  end

  def find_king(color)
  end

  def render
    puts "   #{(0..7).to_a.join('    ')}"
    @grid.each_with_index do |row, i|
      p
      puts "#{i} #{row.join(' ')}"
    end
    p "________________________________________"
  end



  def populate
    pieces = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook, :pawn]
    @grid.each_index do |row|
      if row == 0 || row == 7
        (0..7).each {|idx| @grid[row][idx] = :pawn}
      elsif row == 1 || row == 6
        (0..7).each {|idx| @grid[row][idx] = pieces[8]}
      end
    end
    @grid
  end


end



if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.populate
 b.render
 b.move_piece([0, 1], [0, 2])
 b.render

end
