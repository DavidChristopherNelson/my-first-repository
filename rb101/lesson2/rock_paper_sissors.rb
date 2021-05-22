VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

def display_results(person, computer)
  winning_combos = {
    rock: ["scissors", "lizard"],
    paper: ["rock", "spock"],
    scissors: ["paper", "lizard"],
    spock: ["rock", "scissors"],
    lizard: ["spock", "paper"]
  }

  if winning_combos[person.to_sym].include?(computer)
    prompt("You won!")
  elsif winning_combos[computer.to_sym].include?(person)
    prompt("The computer won.")
  else
    prompt("It's a tie.")
  end
end

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  puts "You chose: #{choice}; Computer chose: #{computer_choice}"

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
