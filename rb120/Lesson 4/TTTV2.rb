require 'pry'

class Board
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # Horizontals
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # Verticals
    [1, 5, 9], [3, 5, 7]] # Diagonals
  
  attr_accessor :state
  
  def initialize
    @state = {}
    (1..9).each {|key| @state[key] = Square.new }
  end
  
  def [](position)
    state[position]
  end
  
  def []=(position, mark)
    state[position].mark = mark
  end
  
  def detect_winner
    winning_combo.size == 3 ? true : false
  end
  
  def display
    puts "     |     |"
    puts "  #{state[1]}  |  #{state[2]}  |  #{state[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{state[4]}  |  #{state[5]}  |  #{state[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{state[7]}  |  #{state[8]}  |  #{state[9]}"
    puts "     |     |"
  end
  
  def empty_squares
    state.select { |_, square| square.empty? }
  end
  
  def full?
    empty_squares.size == 0
  end
  
  def winning_mark
    state[winning_combo[0]].mark
  end
  
  def winning_combo
    winning_combo = WINNING_CONDITIONS.select do |winning_positions|
      state[winning_positions[0]].mark == state[winning_positions[1]].mark &&
      state[winning_positions[0]].mark == state[winning_positions[2]].mark && 
      state[winning_positions[0]].mark != Square::INITIAL_MARKER
    end
    winning_combo.flatten
  end
end

class Square
  INITIAL_MARKER = " "
  
  attr_accessor :mark
  
  def initialize(mark = INITIAL_MARKER)
    @mark = mark
  end
  
  def empty?
    mark == INITIAL_MARKER
  end
  
  def to_s
    mark
  end
end

class Player
  attr_reader :mark
  
  def initialize(mark)
    @mark = mark
  end
  
  def moves(board)
    position = ""
    if mark == TTTGame::HUMAN_MARKER
      puts "Pick an empty square on the board"
      loop do 
        position = gets.chomp.to_i
        break if board[position].mark == Square::INITIAL_MARKER
        puts "That square is not empty. Please pick again."
      end
      board[position] = mark
    elsif mark == TTTGame::COMPUTER_MARKER
      loop do
        position = (1..9).to_a.sample
        break if board[position].mark == Square::INITIAL_MARKER
      end
      board[position] = mark
    end
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  
  attr_accessor :board, :human_player, :computer_player
    
  def initialize
    @board = Board.new
    @human_player = Player.new(HUMAN_MARKER)
    @computer_player = Player.new(COMPUTER_MARKER)
  end
  
  def play
    clear
    display_welcome_message
    board.display
    loop do
      human_player.moves(board)
      clear
      board.display
      break if board.full? || board.detect_winner
      computer_player.moves(board)
      clear
      board.display
      break if board.full? || board.detect_winner
    end
    display_result
    display_goodbye_message
  end
  
  private
  
  def clear
    system "clear"
  end
  
  def display_goodbye_message
    puts "I hope you enjoyed playing Tic Tac Toe."
  end
  
  def display_result
    if board.detect_winner
      puts "Congratulations! You won." if board.winning_mark == HUMAN_MARKER
      puts "The computer won." if board.winning_mark == COMPUTER_MARKER
    elsif board.full?
      puts "It is a tie."
    end
  end
  
  def display_welcome_message
    puts "Welcome to Tic Tac Toe."
  end
end

game = TTTGame.new
game.play