#-----Privacy-----
=begin
class Machine
  
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  private

  attr_writer :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
=end

#-----Fixed Array-----
=begin
class FixedArray
  attr_accessor :fixed_array
  
  def initialize(array_size)
    @fixed_array = Array.new(array_size)
  end
  
  def [](index)
    fixed_array.fetch(index)
  end
  
  def []=(index, value)
    self[index]
    fixed_array[index] = value
  end
  
  def to_a
    fixed_array.clone
  end
  
  def to_s
    fixed_array.to_s
  end
end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
=end

#-----Students-----
=begin
class Student
  
  attr_accessor :name, :year
  
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  attr_accessor :parking
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end
=end

#-----Circular Queue-----
=begin
class CircularQueue
  attr_accessor :queue
  attr_reader :queue_size
  
  def initialize(queue_size)
    @queue = []
    @queue_size = queue_size
  end
  
  def enqueue(element)
    if queue.size < queue_size
      queue << element
    else
      self.dequeue
      queue << element      
    end
  end
  
  def dequeue
    queue.shift
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
=end

#-----Stack Machine Interpretation-----

#-----Number Guesser Part 1-----
=begin
class GuessingGame
  
  def initialize
    @num_guesses_left = 7
    @game_over = false
  end
  
  def play
    generate_target
    until @game_over 
      get_guess
      compare_guess_to_target
    end
  end
  
  private
  
  def generate_target
    @target = rand(99) + 1
  end
  
  def get_guess
    puts "You have #{@num_guesses_left} guesses remaining."
    p "Enter a number between 1 and 100 inclusive: "
    @guess = get_user_input([/^[1-9][0-9]?$|^100$/]).to_i
    @num_guesses_left -= 1
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
  
  def compare_guess_to_target
    if @guess == @target
      puts "That's the number!"
      puts ""
      puts "You won!"
      @game_over = true
    elsif @guess < @target
      puts "Your guess is too low."
    elsif @guess > @target
      puts "Your guess is too high."
    end
    if @num_guesses_left == 0 && !@game_over
      puts "You have no more guesses. You lost."
      @game_over = true
    end
  end
end

game = GuessingGame.new
game.play
=end

#-----Number Guesser Part 2-----
=begin
class GuessingGame
  
  def initialize(lower_bound, upper_bound)
    @range = (lower_bound..upper_bound)
    @num_guesses_left = nil
    @target = nil
    @guess = nil
  end
  
  def play
    reset_game
    loop do 
      display_number_of_guesses
      get_guess
      print_result
      break if @guess == @target || @num_guesses_left == 0
    end
  end
  
  private
  
  def reset_game
    @target = rand(@range)
    @num_guesses_left = Math.log2(@range.size).to_i + 1
  end
  
  def display_number_of_guesses
    if @num_guesses_left == 1
      puts "You have #{@num_guesses_left} guess remaining."
    else
      puts "You have #{@num_guesses_left} guesses remaining."
    end
    @num_guesses_left -= 1
  end
  
  def get_guess
    puts "Enter a number between #{@range.begin} and #{@range.end} inclusive: "
    loop do 
      @guess = gets.chomp.to_i
      break if @range.cover?(@guess)
      puts "Invalid guess. Enter a number between #{@range.begin} and #{@range.end} inclusive: "
    end
  end
  
  def print_result
      puts "Your guess is too low." if @guess < @target
      puts "Your guess is too high." if @guess > @target
      puts "That's the number! You won!" if @guess == @target
      puts "You have no more guesses. You lost!" if @num_guesses_left == 0
  end
end

game = GuessingGame.new(500, 1500)
game.play
=end

#-----Deck of Cards-----
=begin
class Deck
  RANK = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  SUIT = ["Hearts", "Diamonds", "Clubs", "Spades"]
  
  def initialize
    @cards = reset_deck
  end
  
  def draw
    @cards = reset_deck if @cards.size == 0
    @cards.pop
  end
  
  private
  
  def reset_deck
    new_deck = []
    RANK.each do |rank|
      SUIT.each do |suit|
        new_deck << Card.new(rank, suit)
      end
    end
    new_deck.shuffle
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
  
  def value
    return rank.to_i if (2..10).cover?(rank.to_i)
    return 11 if rank.match(/(Jack)/i)
    return 12 if rank.match(/(Queen)/i)
    return 13 if rank.match(/(King)/i)
    return 14 if rank.match(/(Ace)/i)
  end
  
  def <=>(other_card)
    value <=> other_card.value     
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
=end

#-----Poker!-----
=begin
class PokerHand
  
  def initialize(hand)
    @hand = []
    if hand.class == Deck
      5.times {@hand << hand.draw}
      @hand.sort
    elsif hand.class == Array
      @hand = hand.sort
    else
      puts "An error has occurred input must either be a deck or array object."
    end
    @hand_values = @hand.map {|card| card.value }
  end
  
  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    flush? && straight? && (@hand[4].value == 14)
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    return true if @hand_values.count(@hand_values[0]) == 4
    return true if @hand_values.count(@hand_values[4]) == 4
  end

  def full_house?
    return false if @hand_values.uniq.size != 2
    return true if @hand_values.count(@hand_values[0]) == 3
    return true if @hand_values.count(@hand_values[4]) == 3
  end

  def flush?
    @hand.all? do |card|
      card.suit == @hand[0].suit
    end
  end

  def straight?
    (2..14).each_cons(5).to_a.include?(@hand_values)
  end

  def three_of_a_kind?
    @hand_values.uniq.any? do |value|
      @hand_values.count(value) == 3
    end
  end

  def two_pair?
    pair? && @hand_values.uniq.size == 3
  end

  def pair?
    @hand_values.uniq.any? do |value|
      @hand_values.count(value) == 2
    end
  end
end

class Deck
  RANK = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  SUIT = ["Hearts", "Diamonds", "Clubs", "Spades"]
  
  def initialize
    @cards = reset_deck
  end
  
  def draw
    @cards = reset_deck if @cards.size == 0
    @cards.pop
  end
  
  private
  
  def reset_deck
    new_deck = []
    RANK.each do |rank|
      SUIT.each do |suit|
        new_deck << Card.new(rank, suit)
      end
    end
    new_deck.shuffle
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
  
  def value
    return rank.to_i if (2..10).cover?(rank.to_i)
    return 11 if rank.match(/(Jack)/i)
    return 12 if rank.match(/(Queen)/i)
    return 13 if rank.match(/(King)/i)
    return 14 if rank.match(/(Ace)/i)
  end
  
  def <=>(other_card)
    value <=> other_card.value     
  end
end

#Test Cases
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
=end

#-----Stack Machine Interpretation-----
class EmptyStackError < StandardError; end
class InvalidTokenError < StandardError; end

class Minilang
  attr_accessor :register
  
  def initialize(commands)
    @commands = commands.split(" ")
    @stack = Stack.new
    @register = 0
  end
  
  def eval
    commands.each do |command|
      if command.to_i.to_s == command
        self.register = command.to_i
        next
      end
      case command
      when "PUSH" then push
      when "ADD" then add
      when "SUB" then sub
      when "MULT" then mult
      when "DIV" then div
      when "MOD" then mod
      when "POP" then pop
      when "PRINT" then print
      else 
        raise InvalidTokenError, "Invalid token: #{command}"
      end
    end
  end

  private
  attr_reader :commands, :stack
  
  def push
    stack.push(register)
  end
  
  def add
    self.register += stack.pop
  end
  
  def sub
    self.register -= stack.pop
  end
  
  def mult
    self.register *= stack.pop
  end  
  
  def div
    self.register /= stack.pop
  end
  
  def mod
    self.register %= stack.pop
  end
  
  def pop
    self.register = stack.pop    
  end
  
  def print
    puts register
  end
end

class Stack
  
  def initialize
    @stack_array = []
  end
  
  def push(integer)
    stack_array << integer
  end
  
  def pop
    if stack_array.size == 0
      raise EmptyStackError, "Empty stack!"
    end
    stack_array.pop
  end
  
  private
  attr_accessor :stack_array
end

#=begin
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

#Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

#Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
#=end