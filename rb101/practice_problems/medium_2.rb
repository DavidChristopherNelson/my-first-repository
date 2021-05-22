#_____Longest Sentence_____
=begin
Problem
  input: a string
  Output: a string (the longest word)
          a number (how many numbers are in the longest word)

Data structure
  - Split input text into an array of sentences.
  - Have a two element array that contains the index of the largest
    sentence and how many words it contains. 

Algorithm
  - make an array of sentences
  - loop through each sentence
    - Count the number of words (use sentence.split(""))
    - compare the number of words to the result array.
    - update the result array if there are more words. 
  - return the result array. 
    
=end

#=begin
def longest_sentence(text)
  result = ["", 0]
  text.split(/\.|\!|\?/).each do |sentence|
    if sentence.split().size > result[1]
      result = [sentence, sentence.split().size]
    end
  end
  result
end

#Test Case
#p longest_sentence("Hi, my name is David. I was born in Japan! Pleased to meet you?")
p longest_sentence("Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.")
#=end

#_____Now I Know My ABCs_____
=begin
Data structure
  - An array consisting of letter pairs. I prefer this over hash 
    because the hash has directionality that doesn't exist in the
    data.
  
Algorithm
-version1
  - Construct the letter array. 
  - split the input word into letters
  - loop over the letters
    - downcase the letters
    - if the letter does not exist in the letter array return false.
    - if it does
      - find the index of that letter in the array
      - remove that index from the letter array
  - return true
  
-version2
  - Construct the letter array. 
  - split the input word into letters
  - loop over the letters
    -loop over the blocks 
      - if the letter matches then remove that block from the list.
    - if the new block list is the same length as the previous block
      list then no blocks have been used thus return false. 
  - return true
  
-version3
  - Construct the letter hash. 
  - split the input word into letters
  - loop over the letters
    - Check if the letters match any of the letter hash keys. 
    - Check if the letters match any of the letter hash values.
    - If so remove that key value pair.
    - If not then return false. 
  - return true. 

-version4
  - Construct the letter array
  - loop over the letter array
    - search for the block letter in the input word
      - if found remove that letter from the input word and search
        again.
        - if a second instance is found then return false
        - if not then search 
        Not scaleable to more n block faces. 

-version 5 
  - Construct the block array
  - loop over the letters in the input word
    - search the block array for that letter (flatten the array)
    - if no block then return false
    - if block then select all blocks that weren't used for that 
      letter. 
  - return true. 

-version 6
  - Construct the block array
  - loop over the letters in the input word
    - complete selection based on the presence of that letter
    - check if the selected array is smaller than the original. 
  
=end
#code
=begin
def block_word?(word)
  #initalising
  result = true
  blocks = [["b", "o"], ["x", "k"], ["d", "q"], ["c", "p"], 
    ["n", "a"], ["g", "t"], ["r", "e"], ["f", "s"], ["j", "w"], 
    ["h", "u"], ["v", "i"], ["l", "y"], ["z", "m"]]

  word.downcase.split("").each do |letter|
    result = false unless blocks.flatten.include?(letter)
    blocks.select! do |block|
      !block.include?(letter)
    end
  end
  result
end

#test cases
#p block_word?("ab")
#=begin
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
#=end
=end

#_____Lettercase Percentage Ratio_____
=begin
Problem
  Return a hash that states the input string percentages of 
  lowercase letters, uppercase letters and non-letters.
  input string
  output hash
  
Datastructure
  
Algorithm
  - initalize the result hash
  - split the input string into letters. 
  - count the number of uppercase letters.
  - count the number of lowercase letters. 
  - count the number of non-letters.
    - subtract uppercase and lowercase letters from the string size. 
  - set values in the hash based on those counts. 
=end
=begin
def letter_percentages(text)
  results = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  
  text.split("").each do |letter|
    if letter.match(/[a-z]/) 
      results[:lowercase] += 100.0 / text.size
    elsif letter.match(/[A-Z]/) 
      results[:uppercase] += 100.0 / text.size
    else                           
      results[:neither] += 100.0 / text.size
    end
  end
  
  results
end

#Test Cases
#=begin
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
#=end
=end

#_____Matching Parentheses?_____
=begin
  input: string
  output: boolean
  
Data structure
  I will add one to a variable for every open parenthese and subtract
  one for every closed parenthese.

Algorithm
  - inialise the open bracket count variable
  - turn input string into an array of letters.
  - loop over the letters
    - if ( add one to count
    - if ) subtract one from count
    - if count goes negative return false.
  - if count does not equal zero then return false
  - else return true. 
=end

#Code
=begin
def balanced?(text)
  bracket_count = 0
  text.split("").each do |letter|
    bracket_count += 1 if letter == "("
    bracket_count -= 1 if letter == ")"
    break if bracket_count < 0 
  end
  return false if bracket_count != 0
  true
end

#Test Cases
#=begin
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
#=end
=end

#_____Triangle Sides_____
=begin
Problem
  input: three integers
  output: symbol

Data structure
  Save the three integers into an array
  Have a method to check each type of triangle
  
Algorithm
  - Find the biggest number
  - run is triangle method
    - check that the biggest number < the other two numbers added 
      together. If not return :invalid
  - run is equilateral method
    - check if all numbers are equal if so return :equilateral
  - run isosceles method
    - check if two numbers are equal
  - else return scalene

=end
=begin
def is_triangle?(sides)
  return false if sides[2] >= (sides[0] + sides[1])
  return false if sides[0] <= 0
  true
end

def is_equilateral?(sides)
  return true if sides[0] == sides[2]
  false
end

def is_isosceles?(sides)
  return true if (sides[0] == sides[1]) ^ (sides[1] == sides[2])
  false
end

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3].sort!
  return :invalid unless is_triangle?(sides)
  return :equilateral if is_equilateral?(sides)
  return :isosceles if is_isosceles?(sides)
  :scalene
end

#Test Cases
#=begin
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
#=end
=end

#_____Tri-Angles_____
=begin
def triangle(degree1, degree2, degree3)
  degrees = [degree1, degree2, degree3].sort
  case
  when (degrees[0] <= 0) || (degrees.sum != 180)
    :invalid
  when degrees.include?(90)
    :right
  when degrees[2] < 90
    :acute
  when degrees[2] > 90
    :obtuse
  end
end

#Test Case
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
=end

#_____Unlucky Days_____
=begin
Algorithm
  - set counter
  - loop through all the months
    - create a time object for each year, month, 13th day combo
    - If that date is a Friday then add one to the counter
  - return the counter
=end
#Code
=begin
def friday_13th(year)
  num_friday_13s = 0
  1.upto(12) do |month|
    num_friday_13s += 1 if Time.new(year, month, 13).friday?
  end
  num_friday_13s
end
=end

#test cases
=begin
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
=end

#_____Next Featured Number Higher than a Given Value_____
=begin
def featured(num)
  digits = %w(1 2 3 4 5 6 7 8 9 0)
  if num > 9_999_999_999
    puts "There is no possible number that fulfills those requirements."
    return false
  end
  loop do
    num += 1
    if num.odd?
      if num % 7 == 0
        if digits.none? { |digit| num.to_s.chars.count(digit) > 1 }
          return num
        end
      end
    end
  end
end

#test cases
featured(1234)

#=begin
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
#=end
=end

#_____Bubble Sort_____
=begin
Problem
  Sort an array by iterating through it, swapping adjacent elements 
  if they are out of order. Sorting stops when no swaps occur after
  going through all the elements in an interation. 
  input: an array
  output: the input array but mutated

Data Structure
  - Save the changes to a new array every loop iteration and update
    the original array after the loop iteration is complete. 
  
Algorithm
  + loop until the array isn't updated
    + make a copy of the original array
    + loop through the array by index
      + compare the current element to the next element in the array
      + if it is larger swap the element positions
    + if the copy is the same as the original array then break the
      loop.
    - if it isn't then mutate the original array. 
=end
#Code
=begin
def bubble_sort!(array)
  loop do 
    swapped = false
    (array.size - 1).times do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swapped = true
      end
    end
    break unless swapped
  end
end

#Test Cases
#=begin
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
#=end
=end

#_____Sum Square - Square Sum_____
=begin
def sum_square_difference(limit)
  number_array = (1..limit).to_a
  squared_sum = number_array.sum ** 2
  summed_squares = number_array.map { |num| num ** 2 }.sum
  squared_sum - summed_squares
end

p sum_square_difference(3) == 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
=end