require 'colorize'
require 'cursor.rb'

class Display

  def initalize
    @cursor_pos = Cursor.new([0, 0], board)
  end
end
