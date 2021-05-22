#_____Searching 101_____
=begin
Algorithm
  - Get user input and put it into an array. 
  - loop through the array.
    - break with message if the last number equals any in 
      the array. 
=end
=begin
num_array = []
puts "Enter the 1st number:"
num_array[0] = gets.chomp.to_i
puts "Enter the 2nd number:"
num_array[1] = gets.chomp.to_i
puts "Enter the 3rd number:"
num_array[2] = gets.chomp.to_i
puts "Enter the 4th number:"
num_array[3] = gets.chomp.to_i
puts "Enter the 5th number:"
num_array[4] = gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

num_array.length.times do |index|
  puts num_array[index]
  if num_array[index] == last_number
    puts "The number #{last_number} appears in #{num_array}."
    break
  elsif index == 4
    puts "The number #{last_number} does not appear in #{num_array}."
    break
  end
end
=end

#_____Arithmetic Integer_____
=begin
Input: two positive integers
Output: one integer

Algorithm
  - Get input from user and save them to variables
  - Perform all the operations in turn
=end
=begin
puts "Enter the first number:"
num_1 = gets.chomp.to_i
puts "Enter the second number:"
num_2 = gets.chomp.to_i

puts "#{num_1} + #{num_2} = #{num_1 + num_2}"
puts "#{num_1} - #{num_2} = #{num_1 - num_2}"
puts "#{num_1} * #{num_2} = #{num_1 * num_2}"
puts "#{num_1} / #{num_2} = #{num_1 / num_2}"
puts "#{num_1} % #{num_2} = #{num_1 % num_2}"
puts "#{num_1} ** #{num_2} = #{num_1 ** num_2}"
=end

#_____Counting the Number of Characters_____
=begin
puts "Please write word or multiple words:"
input = gets.chomp
number_of_characters = input.delete(" ").length
puts "There are #{number_of_characters} characters in \"#{input}\"."
=end

#_____Multiplying Two Numbers_____
=begin
def multiply(first_number, second_number)
  first_number * second_number
end

puts multiply(5, 3)
=end

#_____Squaring an Argument_____
=begin
def square(num)
  num ** 2
end

puts square(5) == 25
puts square(-8) == 64
=end

#_____Exclusive Or_____
=begin
def xor?(boolean1, boolean2)
  return false if boolean1 == boolean2
  return true if boolean1 != boolean2
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
=end

#_____Odd Lists_____
=begin
def oddities(input_array)
  odd_elements = []
  input_array.length.times do |index|
    odd_elements << input_array[index] if index.even?
  end
  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
=end

#_____Palindromic Strings (Part 1)_____
# Version 1
=begin
def palindrome?(string)
  reverse_string = string.reverse
  return true if string == reverse_string
  false
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
=end 

#_____Palindromic Strings (Part 2)_____
=begin
def real_palindrome?(input)
  puts input
  input = input.downcase.delete('^a-z0-9')
  puts input
  input.downcase == input.downcase.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
=end

#_____Palindromic Numbers_____
def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
palindromic_number?(00220)