# Get messages from file
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def valid_number(num)
  (num.to_i.to_s == num) || (num.to_f.to_s == num)
end

loan_amount = nil
loop do
  puts "How much do you want to borrow? "
  loan_amount = gets.chomp
  if valid_number(loan_amount)
    loan_amount = loan_amount.to_f
    break
  else
    puts MESSAGES["error_message"]
  end
end

apr = nil
loop do
  puts "What is the annumal percentage rate? (please write it as a decimal) "
  apr = gets.chomp
  if valid_number(apr)
    apr = apr.to_f
    break
  else
    puts MESSAGES["error_message"]
  end
end

num_years = nil
loop do
  puts "What is the loan duration in years? "
  num_years = gets.chomp
  if valid_number(num_years)
    num_years = num_years.to_f
    break
  else
    puts MESSAGES["error_message"]
  end
end

mpr = apr / 12.0
num_months = num_years * 12
puts loan_amount * (mpr / (1 - (1 + mpr)**(-num_months)))
