require 'pry'
def shuffle_deck
  deck = []
  card_values = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
  card_suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  deck = card_suits.product(card_values).shuffle
  card_suits.map do |suit|
    card_values.map do |value|
      deck << [suit, value]
    end
  end
  deck
end

def transfer_card_from!(deck, hand)
  new_card = deck.sample
  hand << new_card
  deck.delete(new_card)
end

def deal!(deck, player_hand, dealer_hand)
  [player_hand, dealer_hand].each do |hand|
    transfer_card_from!(deck, hand)
    transfer_card_from!(deck, hand)
  end
end

def total(hand)
  total = 0
  num_aces = 0

  hand.each do |card|
    if card[1].to_i.to_s == card[1]
      total += card[1].to_i
    elsif ['Jack', 'Queen', 'King'].include?(card[1])
      total += 10
    elsif card[1] == 'Ace'
      num_aces += 1
    end
  end

  total = add_aces(total, num_aces)
  total.to_i
end

def add_aces(total, num_aces)
  if num_aces > 0
    total += if (total + 11 + num_aces - 1) < 21
               11 + num_aces - 1
             else
               num_aces
             end
  end
  total
end

def display_hand(hand)
  if hand.flatten.length == 2
    return puts hand[1] + ' of ' + hand[0]
  end
  hand.each do |card|
    puts card[1] + ' of ' + card[0]
  end
end

player_hand = []
dealer_hand = []
# Main game loop
loop do
  # Game setup
  deck = shuffle_deck
  deal!(deck, player_hand, dealer_hand)
  puts "One of the dealer's cards is the"
  display_hand(dealer_hand[0])

  # Player's turn
  loop do
    puts "Here are the cards you've been dealt."
    display_hand(player_hand)
    puts "Your total is #{total(player_hand)}. Do you want to pass or hit? "
    player_decision = gets.chomp.downcase
    break if player_decision == 'pass'
    transfer_card_from!(deck, player_hand)
    break if total(player_hand) > 21
    puts `clear`
  end
  break if total(player_hand) > 21

  # Dealer's turn
  loop do
    break if total(dealer_hand) > 16
    transfer_card_from!(deck, dealer_hand)
    break if total(dealer_hand) > 21
  end
  break if total(dealer_hand) > 21

  break
end

puts `clear`
puts ''
puts ''
puts ''
puts "Here are the cards you've been dealt. "
display_hand(player_hand)
puts "Here are the cards the dealer has been dealt. "
display_hand(dealer_hand)
if total(player_hand) > 21
  puts "Your total is #{total(player_hand)} and you've gone bust and lost."
elsif total(dealer_hand).to_i > 21
  puts "The dealer's total is #{total(player_hand)} he busted you won!"
else
  puts "Here are your cards."
  display_hand(player_hand)
  puts "Your total is #{total(player_hand)}"
  puts "Here are the dealer's cards"
  display_hand(dealer_hand)
  puts "The dealer's total is #{total(dealer_hand)}"
  if total(player_hand) > total(dealer_hand)
    puts "Congratulations you won!"
  else
    puts "The dealer won."
  end
end
