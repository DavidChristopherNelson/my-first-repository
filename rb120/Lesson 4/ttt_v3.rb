class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end
  
  def [](num)
    @squares[num].marker
  end

  def []=(num, marker)
    @squares[num].marker = marker
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

  def full?
    unmarked_keys.empty?
  end

  def opportunity_or_threat_position(your_marker, opponent_marker)
    WINNING_LINES.each do |line|    
      return two_out_of_three(line, your_marker) if two_out_of_three(line, your_marker)
      return two_out_of_three(line, opponent_marker) if two_out_of_three(line, opponent_marker)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def someone_won?
    !!winning_marker
  end
  
  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
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

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
  
  def two_out_of_three(line, marker)
    marker_array = line.select do |position| 
      @squares[position].marker == marker 
    end
    
    if marker_array.size == 2
      line.each { |position| return position if @squares[position].unmarked? }
    end
    nil
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker

  def initialize(marker = nil)
    @marker = marker
    @name = nil
  end
end

class TTTGame
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new(COMPUTER_MARKER)
    @computer.name = ["Hal", "Cortana", "Skynet"].sample
    @human_wins = 0
    @computer_wins = 0
  end

  def play
    system "clear"
    display_welcome_message
    set_user_settings
    main_game
    display_goodbye_message
  end

  private

  def clear_screen_and_display_board
    system "clear"
    display_board
  end

  def computer_moves
    return board[strategic_placement] = computer.marker if strategic_placement != nil
    return board[5] = computer.marker if board.unmarked_keys.include?(5)
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
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

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def get_user_input(acceptible_responses)
    response = nil
    loop do 
      response = gets.chomp
      received_acceptible_response = acceptible_responses.any? do |acceptible_response|
        response.match(acceptible_response)
      end
      break if received_acceptible_response == true
      puts "Sorry your response doesn't fit the required format. Please try again."
    end  
    response
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

  def human_turn?
    @current_marker == human.marker
  end

  def joiner(array)
    return "#{array[0]}" if array.size == 1
    "#{array[0..-2].join(', ')}, or #{array[-1]}"
  end

  def main_game
    loop do
      who_goes_first
      display_board
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
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

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def reset
    board.reset
    system "clear"
  end

  def set_user_settings
    puts "My name is #{computer.name} what is your name? (names can only contain characters)"
    @human_name = get_user_input([/^[a-z]*$/i])
    puts "Hello #{@human_name}, it is a pleasure to meet you."
    
    puts "What marker would you like to play as?"
    human.marker = get_user_input([/^.$/])
  end

  def strategic_placement
    board.opportunity_or_threat_position(computer.marker, human.marker)
  end

  def who_goes_first
    puts "Do you want to decide who goes first? (y/n)"
    response = get_user_input([/(^y$)|(^n$)/i]).downcase
    if response == "n"
      @current_marker = [human.marker, COMPUTER_MARKER].sample 
      return
    end
    
    puts "Do you want to go first? (y/n)"
    response = get_user_input([/(^y$)|(^n$)/i]).downcase
    @current_marker = human.marker if response == "y"
    @current_marker = COMPUTER_MARKER if response == "n"
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
end

game = TTTGame.new
game.play
