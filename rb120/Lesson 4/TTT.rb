require 'pry'
class Board
  INITIAL_MARKER = " "
  def initialize
    @squares = []
    (0..2).each do |_|
      @squares << [INITIAL_MARKER, INITIAL_MARKER, INITIAL_MARKER]
    end
  end
  
  def get_square_at(x_index, y_index)
    @squares[x_index][y_index]
  end
  
  def set_square_at(x_index, y_index, player)
    @squares[x_index][y_index] = Square.new(player.mark)
  end
  
  def empty_squares
    empty_squares_array = []
    (0..2).each do |x_index|
      (0..2).each do |y_index|
        empty_squares_array << [x_index, y_index] if @squares[x_index][y_index] == TTTGame::COMPUTER_MARKER
        empty_squares_array << [x_index, y_index] if @squares[x_index][y_index] == TTTGame::HUMAN_MARKER
      end
    end
    empty_squares_array
  end
end

class Square
  attr_accessor :marker
  def initialize(mark)
    @marker = mark
  end
  
  def to_s
    marker
  end
end

class Player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  
  attr_reader :board, :human, :computer
  
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end
  
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end
  
  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!"
  end
  
  def display_board
    puts ""
    puts "   |   |   "
    puts " #{board.get_square_at(0,0)} | #{board.get_square_at(1,0)} | #{board.get_square_at(2,0)}"
    puts "   |   |   "
    puts "---+---+---"
    puts "   |   |   "
    puts " #{board.get_square_at(0,1)} | #{board.get_square_at(1,1)} | #{board.get_square_at(2,1)}"
    puts "   |   |   "
    puts "---+---+---"
    puts "   |   |   "
    puts " #{board.get_square_at(0,2)} | #{board.get_square_at(1,2)} | #{board.get_square_at(2,2)}"
    puts "   |   |   "
  end
    
  def human_moves
    puts "Chose an x position"
    x_index = nil
    y_index = nil
    loop do 
      puts "Chose an x position"
      x_index = gets.chomp.to_i
      puts "Chose a y position"
      y_index = gets.chomp.to_i
      message = nil
      
      board.empty_squares.each do |coordinate|
        p coordinate
        message = "Sorry, that's not a valid choice." if (x_index = coordinate[0] && y_index = coordinate[1])
      end
      
      message ? puts(message) : break
    end
    
    board.set_square_at(x_index, y_index, human)
  end
  
  def computer_moves
    x_index = nil
    y_index = nil
    loop do 
      x_index = (0..2).to_a.sample
      y_index = (0..2).to_a.sample
      taken = nil
      board.empty_squares.select do |coordinate|
        taken = "yes" if x_index = coordinate[0] && y_index = cordinate[1]
      end
      break if taken == nil
    end
    board.set_square_at(x_index, y_index, computer)
  end
  
  def play
    display_welcome_message
    display_board
    loop do
      human_moves
     # break if someone_won? || board_full?

      computer_moves
      display_board
     # break if someone_won? || board_full?
    end
    #display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play