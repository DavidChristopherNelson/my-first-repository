#Easy 1
#Repeat
=begin
def repeat(string, num_of_repeats)
  num_of_repeats.times { puts string}
end

repeat('Hello', 3)
=end

#odd
=begin
def is_odd?(num)
  num % 2 == 1 
end

#test
puts is_odd?(2) == false
puts is_odd?(5) == true
puts is_odd?(-17) == true
puts is_odd?(-8) == false
puts is_odd?(0) == false
puts is_odd?(7) == true
=end

#List of Digits
=begin
def digit_list(num)
  return_array = []
  num.to_s.each_char do |character|
    return_array << character.to_i
  end
  return_array
end


#test
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=end

#How Many?
=begin
Practice PEDAC
Problem 
  Input: An array of strings
  Output: Various things printed to the display. 
  
Test Cases
  vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ]
  count_occurrences(vehicles) 
  
  Expected output
  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2

Data structure
  I will print the output as I loop through the array of unique strings. 

Algorithm
  - generate a unique array of inputs
  - loop through the unique array of inputs 
    - count how many instances of that string occur in the input string
    - print the string along with the count
    
Code
=end 
=begin
def count_occurrences(vehicles)
  vehicles.uniq.each do |vehicle|
    puts "#{vehicle} => #{vehicles.count(vehicle)}"
  end
end

 vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ]
  count_occurrences(vehicles) 
=end

=begin
numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size

loop do
  number = numbers[-counter]
  for num in 1..number
    puts num
  end

  break if counter == 1
  counter -=1
end
=end

=begin
_____ Reverse It _____
Problem
  Input: String
  Output: String
  Requirements: The output string must have all the words in 
    the reverse order. 
  Questions: 
    - What is a word? I will assume it is any group 
    of letters that has a space on either side. 
    - Do I keep the original capitalisation? I assume yes. 
    
Examples
  puts reverse_sentence('') == ''
  puts reverse_sentence('Hello World') == 'World Hello'
  puts reverse_sentence('Reverse these words') == 'words these Reverse'

Data Structure
  Split the input string into an array of words.

Algorithm
  - Create an array containing all  of the words in the input
    string. 
  - Reverse the order of the array
    - Either find a method that does it or use a loop 
      and the puts command.
  - Convert the array into the output string and return it

Code
=end

# Version 1
=begin
def reverse_sentence(sentence)
  words = sentence.split(" ")
  reverse_words = []
  words.length.times do 
    reverse_words << words.pop
  end
  reverse_words.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
=end

# Version 2
=begin
def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')  
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
=end

#_____Reverse It (Part 2)_____
=begin
Problem
  Input: A string containing one or more words
  Output: A string
  
Examples
  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS

Data Structure/Algorithm
  - split the parameter string into an array of words. 
  - Check if the word is longer than five letters
    - If so then reverse all the letters in the word
      - To do that split the word into an array of letters 
      - Reverse the order of the letters
  - Turn the array into a string and return the string. 

Code
=end
# Version 1
=begin
def reverse_words(sentence)
  words = sentence.split(" ")
  words = words.map do |word|
    if word.length >= 5
      word = word.split('').reverse.join
    end
    word
  end
  words.join(" ")
end

puts reverse_words('Professional')          == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School')         == "hcnuaL loohcS"
=end

#Version 2
=begin
def reverse_words(sentence)
  words = sentence.split(" ")
  words = words.map do |word|
    if word.length >= 5
      word.reverse!
    end
    word
  end
  words.join(" ")
end

puts reverse_words('Professional')          == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School')         == "hcnuaL loohcS"
=end

#_____Stringy Strings_____
=begin
Problem
  Input: A positive integer
  Output: A string 
  Requirements: The string must start with 1, alternate 
    between 1 and 0 and be the same length as the input 
    integer. 
  
Test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Data Structure

Algorithm
  - Initalise an empty string
  - Loop input parameter amount of times
    - concatenate either a 1 or 0 depending on if the loop
      index was odd or even. 
  - return the string

Code
=end
=begin
def stringy(length_of_string)
  binary_string = ""
  length_of_string.times do |index|
    binary_string << "1" if index.even? 
    binary_string << "0" if index.odd?
  end
  binary_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
=end

#_____Array Average_____
=begin
Problem 
  Input: Array containing integers
  Output: Integer
  Requirement: The output integer must be the average of all
  the elements in the input array. 

Test Cases
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

Algorithm
  - Initialize 
  
Code
=end

#Version 1
=begin
def average(array)
  average = array.sum / (array.length)
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
=end

=begin
_____Sum of Digits_____
Problem
  Input: Positive integer
  Output: Integer

Test Cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

Code
=end

#Version 1
=begin
def sum(number)
  number.to_s.chars.map{ |element| element.to_i }.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end

#_____What's my Bonus_____
=begin
Problem
  Input:
    - Positive Integer
    - Boolean
  Output:
    - Integer

Test Cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

Algorithm

Code
=end

#Version 1
def calculate_bonus(salary, bonus)
  bonus ? salary.to_f / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000