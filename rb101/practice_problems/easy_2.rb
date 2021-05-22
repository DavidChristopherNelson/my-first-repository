#_____How old is Teddy?_____
#Version 1
=begin
def teddy_age
  puts "Teddy is #{rand(20..200)} years old!"
end

teddy_age
=end

#_____How big is the room?_____
#Version 1
=begin
SQMETERS_TO_SQFEET = 10.7639
puts "Enter the length of the room in meters: "
length = gets.chomp.to_f
puts "Enter the width of the room in meters: "
width = gets.chomp.to_f
puts "The area of the room is #{(length*width).round(2)} square meters (#{conversion*length*width} square feet)."
=end

#_____Tip calculator_____
#Version 1
=begin
puts "What is the bill? "
bill = gets.chomp.to_f
puts "What is the tip percentage? "
tip_percentage = gets.chomp.to_f / 100

puts "The tip is $#{(bill * tip_percentage).round(3)}"
puts "The total is $#{(bill * (1 + tip_percentage)).round(3)}"
=end

#_____When will I Retire_____
=begin
current_year = Time.now.year
puts "What is your age? "
age = gets.chomp.to_i
puts "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

puts "It's #{current_year}. You will retire in #{current_year + retirement_age - age}."
puts "You only have #{retirement_age - age} years of work to go!"
=end

#_____Greeting a user_____
=begin
puts "What is your name? "
name = gets.chomp
if name[-1] == "!"
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end 
=end

#_____Odd Numbers_____
=begin
(1..99).each do |number|
  puts number if number.odd?
end
=end

#_____Even Numbers_____
=begin
(1..99).each do |number|
  puts number if number.even?
end
=end

#_____Sum or Product of Consecutive Integers_____
puts ">> Please enter an integer greater than 0: "
number = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp

if operator == "s"
  sum = 0
  (1..number).each do |num| 
    sum = sum + num 
  end
  puts "The sum of the integers between 1 and #{number} is #{sum}."
end

if operator == "p"
  product = 1
  (1..number).each do |num| 
    product = product * num 
  end
  puts "The product of the integers between 1 and #{number} is #{product}."
end
