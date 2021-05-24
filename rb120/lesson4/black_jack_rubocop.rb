# rubocop:disable Layout/LineLength
class Participant
  FACE_CARDS = ["jack", "queen", "king"]

  attr_accessor :name
  attr_reader :hand

  def initialize
    @name = ""
    @hand = []
  end

  def add_card(card)
    hand << card
  end

  def display_cards
    puts "----------------------------------------"
    puts "#{name} has been dealt"
    hand.each { |card| puts "The #{card}" }
    puts "#{name} total score is #{total}"
  end

  def total
    total = 0
    total = count_number_cards(total)
    total = count_face_cards(total)
    total = count_aces(total)
    total
  end

  private

  attr_writer :hand

  def count_number_cards(running_total)
    hand.each do |card|
      running_total += card.value.to_i if card.value.to_i.to_s == card.value
    end
    running_total
  end

  def count_face_cards(running_total)
    hand.each do |card|
      running_total += 10 if FACE_CARDS.include? card.value
    end
    running_total
  end

  def count_aces(running_total)
    num_aces = 0
    hand.each { |card| num_aces += 1 if card.value == "ace" }

    return running_total if num_aces == 0
    return (running_total + 11 + num_aces - 1) if (running_total + 11 + num_aces - 1) < 22
    return running_total + num_aces if (running_total + 10 + num_aces) > 22
  end
end

class Deck
  SUITS = ["hearts", "diamonds", "clubs", "spades"]
  VALUES = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
  end

  def deal_a_card
    cards.delete(cards.sample)
  end

  private

  attr_accessor :cards
end

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end
end

class Game
  END_GAME_MESSAGES = {
    player_busted: "Sorry you busted and so you lose.",
    dealer_busted: "The dealer busted and you win!",
    player_total_higher: "Your total is higher than the dealer's total. You win!",
    dealer_total_higher: "Your total is lower than the dealer's total. You lose.",
    tie: "Your total is equal to the dealer's total. It is a tie."
  }

  def initialize
    @deck = Deck.new
    @player = Participant.new
    @dealer = Participant.new
  end

  def start
    welcome
    deal_initial_cards
    show_dealer_card
    player_turn
    dealer_turn
    show_result
  end

  private

  attr_accessor :deck, :player, :dealer

  def welcome
    puts "----------------------------------------"
    system "clear"
    puts "Welcome to the game of 21!"
    puts "What is your name? (it can only contain letters)"
    player.name = get_user_input([/^[a-z]*$/i])
    puts "Thank you #{player.name}. I hope you enjoy the game."
    dealer.name = "Dealer"
  end

  def deal_initial_cards
    2.times { player.add_card(deck.deal_a_card) }
    2.times { dealer.add_card(deck.deal_a_card) }
  end

  def show_dealer_card
    puts "The #{dealer.name} got a #{dealer.hand[0]}."
  end

  def player_turn
    loop do
      player.display_cards
      puts "#{player.name} do you want to hit or stay?"
      decision = get_user_input([/^h$/i, /^s$/i, /(^hit$)/i, /(^stay$)/i])
      hit_or_stay(decision)
      break if decision.match(/(^s$)|(^stay$)/i)
      break if player.total > 21
    end
  end

  def hit_or_stay(decision)
    if decision.match(/(^h$)|(^hit$)/i)
      dealt_card = deck.deal_a_card
      player.add_card(dealt_card)
      puts "You hit and you got a #{dealt_card}"
    elsif decision.match(/(^s$)|(^stay$)/i)
      puts "#{player.name} decides to stay."
    end
  end

  def dealer_turn
    return if player.total > 21
    loop do
      break if player.total < dealer.total
      break if dealer.total > 16
      dealer.add_card(deck.deal_a_card)
    end
  end

  def show_result
    system "clear"
    player.display_cards
    dealer.display_cards
    puts END_GAME_MESSAGES[calculate_winner]
  end

  def calculate_winner
    player_total = player.total
    dealer_total = dealer.total
    return :player_busted if player_total > 21
    return :dealer_busted if dealer_total > 21
    return :player_total_higher if player_total > dealer_total
    return :dealer_total_higher if dealer_total > player_total
    return :tie if player_total == dealer_total
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
end

Game.new.start
# rubocop:enable Layout/LineLength
