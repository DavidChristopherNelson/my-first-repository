class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  
  def winning_position(computer_marker)
    WINNING_LINES.each do |line|
      array_computer_markers = line.select do |position| 
        @squares[position].marker == computer_marker 
      end
      num_computer_markers = array_computer_markers.size
      if num_computer_markers == 2
        line.each do |position|
          return position if @squares[position].unmarked?
        end
      end
    end
    nil
  end
  
  def block_position(human_marker)
    WINNING_LINES.each do |line|
      array_human_markers = line.select do |position|
=begin
        p "human_marker #{human_marker}"
        p "@squares[position] #{@squares[position]}"
        p "@squares[position].marker #{@squares[position].marker}"
        p "@squares[position].marker == human_marker #{@squares[position].marker == human_marker }"
=end
        @squares[position].marker == human_marker 
      end
      #puts "The array of human markers is #{array_human_markers}"
      num_human_markers = array_human_markers.size
      if num_human_markers == 2
        line.each do |position|
          return position if @squares[position].unmarked?
        end
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @human_wins = 0
    @computer_wins = 0
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    #clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square (#{joiner(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end
  
  def joiner(array)
    return "#{array[0]}" if array.size == 1
    "#{array[0..-2].join(', ')}, or #{array[-1]}"
  end

  def computer_moves
    return board[winning_position] = computer.marker if winning_position != nil
    return board[block_position] = computer.marker if block_position != nil
    board[board.unmarked_keys.sample] = computer.marker
  end
  
  def winning_position
    board.winning_position(computer.marker)
  end
  
  def block_position
    puts "The return value of block position is #{board.block_position(computer.marker)}"
    board.block_position(human.marker)
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      @human_wins += 1
      puts "You won!"
    when computer.marker
      @computer_wins += 1
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
    puts "You have now won #{@human_wins} games and the computer has won #{@computer_wins} games."
    puts "First to five wins the tournament."
    tournament_result  
  end
  
  def tournament_result
    if @human_wins == 5
      puts "You have won the tournament."
      @human_wins = 0
      @computer_wins = 0
    elsif @computer_wins == 5
      puts "The computer has won the tournament."
      @human_wins = 0
      @computer_wins = 0
    end  
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play