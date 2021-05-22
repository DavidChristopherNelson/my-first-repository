#_____Sum of Sums_____
=begin
def sum_of_sums(array)
  sum = 0
  array.each_index do |index|
    sum += array[0..index].sum
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
=end

#_____Madlibs_____
=begin
print "Enter a noun: "
noun = gets.chomp
print "Enter a verb: "
verb = gets.chomp
print "Enter an adjective: "
adjective = gets.chomp
print "Enter an adverb: "
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
puts "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
puts "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."
=end

#_____Leading Substrings_____
=begin
def leading_substrings(string)
  string_array = []
  string.size.times do |index|
    string_array << string[0..index]
  end
  string_array
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
=end

#_____All Substrings_____
=begin
def substrings(string)
  return_array = []
  string.length.times do |start_index|
    start_index.upto(string.length-1) do |end_index|
      return_array << string[start_index..end_index]
    end
  end
  return_array
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
=end

#_____Palindromic Substrings_____
=begin
Algorithm
  - Get all substrings (use method from previous exercise)
  - Map substrings to return_array if they are palindromes.
    - Write a method to determin if a string is a palindrome.
      - Compares string to its reverse. 
  - Return the return_array
=end
=begin
def palindrome?(string)
  string == string.reverse
end

def substrings(string)
  results = []
  string.length.times do |start_index|
    start_index.upto(string.length-1) do |end_index|
      results << string[start_index..end_index]
    end
  end
  results
end

def palindromes(string)
  substrings(string).select do |substring| 
    palindrome?(substring) && substring.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
=end

#_____fizzbuzz_____
=begin
def fizzbuzz(lower_bound, upper_bound)
  result = ""
  lower_bound.upto(upper_bound) do |index|
    if index % 3 == 0 && index % 5 == 0
      result << "FizzBuzz"
    elsif index % 3 == 0
      result << "Fizz"
    elsif index % 5 == 0 
      result << "Buzz"
    else 
      result << index.to_s
    end
    result << ", " unless upper_bound == index
  end
  print result
end

fizzbuzz(1, 15)
=end

#_____Double Char (Part 1)_____
=begin
Algorithm
  - split the input string into an array of characters
  - loop through the array of characters concatinating two of each
    into the output string
  - return the output string
=end
=begin
def repeater(text)
  result = ""
  text.chars.each do |char|
    result << char * 2
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
=end

#_____Double Char (Part 2)_____
=begin
def double_consonants(string)
  result = ""
  string.chars.each do |char|
    if char.match(/[bcdfghjklmnpqrstvwxyz]/i)
      result << char * 2
    else
      result << char
    end
  end
  result
end

#double_consonants('String')

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
=end

#_____Reverse the Digits In a Number_____
=begin
def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
=end

#_____Get The Middle Character_____ Time 7:21
=begin
def center_of(string)
  result = ""
  length = string.length
  if length.even?
    #p "return two characters"
    result = string[(length/2 - 1)..(length/2)]
  else
    #p "return one character"
    result = string[string.length/2]
  end
  result
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
=end

#