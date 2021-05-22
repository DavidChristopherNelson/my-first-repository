#_____Welcome Stranger_____4:53
=begin
def greetings(array, hash)
  name = array.join(" ")
  "Hello, #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

#test
#p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=end

#_____Double Doubles_____ >20min
=begin
Algorithm
  - Check if number is a double number
    - Check if number has even number of digits
    - Check if number has left and right sides matching
      - Convert to array and get left and right sides by index
    - return num if it is a double number
  - return 2* num
=end

# Version 1
=begin
def twice(num)
  num = num.to_s
  if num.length.even? 
    left_side = num[0..((num.length / 2) - 1)]
    right_side = num[(num.length / 2)..(num.length - 1)]
    if left_side == right_side
      num = num.to_i
    else
      num = num.to_i 
      num *= 2
    end
  else
    num = num.to_i
    num *= 2
  end
  num
end

#test
#=begin
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
#=end
=end

#_____Version 2_____
=begin
def twice(num)
  string_num = num.to_s
  center = string_num.size / 2
  left_side = string_num[0..center - 1]
  right_side = string_num[center..-1]
  return num * 2 if center == 0
  return num if left_side == right_side
  num * 2
end

#Test
#=begin
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
#=end
=end

#_____Always Return Negative_____1:29
=begin
def negative(num)
  num *= -1 if num > 0
  num
end

#tests
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
=end

#_____Counting Up_____2:55
=begin
Algorithm
  - Use upto command to iteratively add elements to the output array. 
=end

=begin
def sequence(num)
  num > 0 ? (1..num).to_a : (num..-1).to_a
#  result = []
#  1.upto(num) do |element|
#    result << element
#  end
  result
end

#test
#=begin
p sequence(0) #== [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
#=end
=end

#_____Uppercase Check_____3:04
=begin
Algorithm
  - Use regex to match any lowercase alphabetic characters. 
=end
=begin
def uppercase?(string)
  string.match(/[a-z]/) ? false : true
end

#test
#=begin
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
#=end
=end

#_____How long are you?_____6:54
=begin
Problem
  input: a string
  output: an array
  
Test Cases
  see below
  
Data Structure
  Save the output into a result array.  

Algorithm
  - Create an empty result array
  - Split the string into an array of words. 
  - loop through the word array
    - Calculate the length of each word. 
    - Concaternate the word and length into the result array. 
  - return the result array
  
Code
=end
=begin
def word_lengths(sentence)
  result = []
  words = sentence.split(" ")
  words.each do |word|
    result << "#{word} #{word.length}"
  end
  result
end

#test
#=begin
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
#=end
=end

#_____Name Swapping_____3:37
=begin
Algorithm
  - Split string into an array containing all the words. 
  - Create and return a string from parts of that array
=end
=begin
def swap_name(name)
  name_array = name.split(" ")
  "#{name_array[1]}, #{name_array[0]}"
#  "#{name.match(/\w*$/).to_s}, #{name.match(/^\w*/).to_s}"
end

#Test
#=begin
p swap_name('Joe Roberts') == 'Roberts, Joe'
#=end
=end

#_____Sequence Count_____7:22
=begin
Problem
num1 = Size of output array
num2 = count = how much each element is incremented. 
The first output array element is 0 + count
Count can be negative
  Input: two numbers
  Output: an array

Algorithm
  - Create the empty result array
  - loop num1 times
    - Add count to result array
    - count += count
  - Output result array
=end
=begin
def sequence(size, count)
  result = []
  1.upto(size) do |index|
    result << index * count
  end
  result
end


#p sequence(4, -7) #== [-7, -14, -21, -28]

#Test
#=begin
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
#=end
=end

#_____Grade Book_____7:53
=begin
Data Structure

Algorithm
 - 
=end
=begin
def get_grade(score1, score2, score3)
  result = ""
  average = (score1 + score2 + score3) / 3.0
  
  if average >= 90
    result = "A"
  elsif average >= 80
    result = "B"
  elsif average >= 70
    result = "C"
  elsif average >= 60
    result = "D"
  else
    result = "F"
  end
  result
end

#test
#=begin
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
#=end
=end

#_____Grocery List_____5:23
=begin
Problem
  Input: array
  Output: a different array
  
Algorithm
  - Create return array
  - Loop through grocery_list
    - add correct number of items to return array
  - Return the return array
  
=end
=begin
def buy_fruit(grocery_list)
  result = []
  grocery_list.each do |fruit|
    fruit[1].times do |_|
      result << fruit[0]
    end
  end
  result
end

#test
#=begin
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
#=end
=end

#_____Group Anagrams_____30.50
=begin
Problem
  Input: an array of words
  Output: an array of array of words

Algorithm
  anagram
    - initalize a results array
    - initalize a checked array
    - loop through the array
      - search checked_array to see if the element has been checked
      - Select elements that anagram? is true and save them into 
        checked array
      - Put select elements into results array
    -return results array
  
  anagram?
    - Check if two words are anagrams of each other
    - Split both words into an array of characters
    - sort the characters
    - compare the arrays
    - return result
=end
=begin
def anagram?(word_1, word_2)
  word_1.chars.sort == word_2.chars.sort
end

def anagram(words)
  results = []
  while words.size > 0 
    word_1 = words.pop
    anagrammed_words = words.select do |word_2|
      anagram?(word_1, word_2)
    end
    anagrammed_words << word_1
    words.delete(anagrammed_words)
    results << anagrammed_words unless anagrammed_words.size == 1
  end
  results
end

#p anagram(["hello", "hi", "g'day", "ohell"])

#Test Cases
#=begin
words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
p anagram(words) #== [["demo", "dome", "mode"], ["neon", "none"], ["fowl", "wolf"]]
#=end
=end
