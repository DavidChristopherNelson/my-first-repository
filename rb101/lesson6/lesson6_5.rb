require "pry"

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal lines
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # verticle lines
                  [1, 5, 9], [3, 5, 7]]            # diagonal lines

# rubocop: disable Metrics/AbcSize
def display_board(board_state)
  puts `clear`
  puts "   |   |   "
  puts " #{board_state[1]} | #{board_state[2]} | #{board_state[3]}"
  puts "   |   |   "
  puts "-----------"
  puts "   |   |   "
  puts " #{board_state[4]} | #{board_state[5]} | #{board_state[6]}"
  puts "   |   |   "
  puts "-----------"
  puts "   |   |   "
  puts " #{board_state[7]} | #{board_state[8]} | #{board_state[9]}"
  puts "   |   |   "
end
# rubocop: enable Metrics/AbcSize

def initial_board_state
  new_board = {}
  (1..9).each { |index| new_board[index] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    puts "Choose a square (#{joinor(empty_squares(brd))}): "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  WINNING_COMBOS.each do |three_in_a_row|
    place_to_go = find_at_risk_square(three_in_a_row, brd)
  end
  brd[place_to_go] = COMPUTER_MARKER
end

def find_at_risk_square(three_in_a_row, brd)
    position_under_consideration = three_in_a_row.select { |position| brd[position] != PLAYER_MARKER }
    if position_under_consideration.size == 1
      if brd[position_under_consideration[0]] != COMPUTER_MARKER
        return brd[position_under_consideration[0]]
      end
    elsif
      position_under_consideration = three_in_a_row.select { |position| brd[position] != COMPUTER_MARKER }
      if position_under_consideration.size == 1
        if brd[position_under_consideration[0]] != PLAYER_MARKER
          return brd[position_under_consideration[0]]
        end
      end 
    else
      return brd[empty_squares(brd).sample] 
    end
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# rubocop: disable Metrics/CyclomaticComplexity
def detect_winner(brd)
  WINNING_COMBOS.each do |three_in_a_row|
    if brd[three_in_a_row[0]] == PLAYER_MARKER &&
       brd[three_in_a_row[1]] == PLAYER_MARKER &&
       brd[three_in_a_row[2]] == PLAYER_MARKER
       return "Player" 
    elsif brd[three_in_a_row[0]] == COMPUTER_MARKER &&
       brd[three_in_a_row[1]] == COMPUTER_MARKER &&
       brd[three_in_a_row[2]] == COMPUTER_MARKER
       return "Computer" 
    end
  end
  nil
end
# rubocop: enable Metrics/CyclomaticComplexity

def joinor(array, delimiter = ", ", last_delimiter = "or")
  last_element = array.pop
  array.join(delimiter) + "#{delimiter}#{last_delimiter} " + "#{last_element}"
end

num_player_wins = 0 
num_computer_wins = 0
loop do
  board = initial_board_state
  display_board(board)

  loop do
    player_places_piece!(board)
    display_board(board)
    break if someone_won?(board) == true || board_full?(board) == true

    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) == true || board_full?(board) == true
  end

  if someone_won?(board)
    puts "The #{detect_winner(board)} won!"
  elsif board_full?(board) == true
    puts "It is a tie."
  end
  
  num_player_wins += 1 if detect_winner(board) == "Player"
  num_computer_wins += 1 if detect_winner(board) == "Computer"
  puts "The score is as follows"
  puts "The player has won #{num_player_wins} games."
  puts "The computer has won #{num_computer_wins} games."
  if (num_player_wins > 4) || (num_computer_wins > 4)
    num_player_wins = 0 
    num_computer_wins = 0
    puts "Would you like to play another first to five games? (y/n)"
    play_again = gets.chomp
    break if play_again.downcase == "n"
  end
  puts "Press any key to play the next match. "
  any_key = gets.chomp
end
