#_____Rotation (Part 1)_____7:53
=begin
Problem
  First element goes to the last index of the array and all the other
  elements shift up one index. 
  Input: an array
  Output: a different array

Data structure
  arrays

Algorithm
  - initiate the result array
  - Loop through the input array
    - have a conditional for the first index to place that element at the end
    - allocate each element to its position in the new array. 
  - return result array
=end
#Code
=begin
def rotate_array(input_array)
  result = []
  input_array.each_with_index do |element, index|
    next if index == 0
    result << element
  end
  result << input_array[0]
  result
end

#p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]

#Test Cases
#=begin
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
#=end
=end

#_____Rotation (Part 1)_____ 2nd attempt 9:36
=begin
Problem
The method should return a new array with the element that was first in the argument array now 
last.
  Input: An Array
  Output: A new Array

Data structure
  Initialize a new array at the beginning of the method that is used to output the result. 

Algorithm
  + make a duplicate of the parameter array. 
  + shift the first element from the array.
  + append that element to the end of the array.
  + return the array. 

=end
# Code
=begin
def rotate_array(array)
  rotated_array = array.dup
  rotated_array << rotated_array.shift
end
=end

# Test cases
=begin
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
=end

#_____Rotation (Part 2)______ 2nd Attempt
=begin
Problem
For a given number rotate the last `n` digits of that number. I will assume that `n` is less
than the length of the given number. 
  Input: Two integers
  Output: A new integer

Datastructure
  Split the number to be rotated into an array of strings. 

Algorithm
  + Convert the input number into an array of strings.
  + Pass the last n elements of that array into the method rotate_array
  - Append the return value of that method to the array of strings
  - Convert the array of strings back into an integer
  - Return that integer
=end
# Code
def rotate_array(array)
  rotated_array = array.dup
  rotated_array << rotated_array.shift
end

def rotate_rightmost_digits(number_to_be_rotated, n)
  array_of_digits = number_to_be_rotated.to_s.chars
  results = array_of_digits[0..(-n - 1)] + rotate_array(array_of_digits[-n..-1])
  results.join("").to_i
end

# Test Cases
#=begin
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
#=end






#_____Rotation (Part 2)_____9:15
=begin
Problem
  Input: integer
  Output: integer
  
Algorithm
  - Turn the number into a string 
  - Turn the string into an array of characters
  - Delete element to be moved
  - Append deleted element to the end of the array
  - convert the array into a string then into a number
  - return the number
  
=end
#Code
=begin
def rotate_rightmost_digits(input_num, index)
  chars_of_num = input_num.to_s.chars
  deleted_char = chars_of_num.delete_at(-index)
  chars_of_num << deleted_char
  chars_of_num.join().to_i
end

#test
#=begin
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
#=end
=end

#_____Rotation (Part 3)_____
#13 solved exept for the last test. 19:20 to solve the bug (calling
# .size on an integer instead of a string)

=begin
Algorithm
  - convert number into an array of characters
  - loop array.size times
    - Use the index number to call rotate_rightmost_digits
  - convert he character array into the result number
  - return the result number
=end
=begin
def rotate_rightmost_digits(input_num, index)
  chars_of_num = input_num.to_s.chars
  deleted_char = chars_of_num.delete_at(-index)
  chars_of_num << deleted_char
  chars_of_num.join().to_i
end

def max_rotation(num)
  num.to_s.size.times do |index|
    num = rotate_rightmost_digits(num, num.to_s.size - index)
  end
  num
end

#Test Cases
#=begin
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
#=end
=end

#_____1000 Lights_____46min but I was sick
=begin
Problem 
  There are n switches. Initial state is off. There are n passes,
  each pass toggles switches according to the pattern.
    pass 1: toggle every switch 1, 2, 3, etc
    pass 2: toggle every second switch 2, 4, 6, etc
    pass 3: toggle every third switch etc 3, 6, 9, etc
  Input: An integer representing both the number of lights and the
    number of passes. 
  Output: An array that contains the index of all the switches that
    are on after n passes. 
  Assumptions
    - The switch bank index starts at 1. 
    - Return an empty array if no switches are on.
    - Return an empty array if there are no switches in the bank.
    - Assume n is an integer equal to or larger than 0

Test Cases
switch_bank(0) == []
switch_bank(1) == [1]
switch_bank(2) == [1]
switch_bank(5) == [1, 4]
switch_bank(10) == [1, 4, 9]

Option 1
Datastructure
  - I will use an array of booleans to represent the on off state
    of the switch bank. 

Algorithm
  - Initialise the switch bank array to all false. 
  - loop n times
    - toggle switch at counter position
    - Increment counter
  - Generate the return array. 
    - loop until find index returns nil.
    - add that index to the result array.
    - remove that index from the switch bank. 
  - return the result array. 

Option 2
Datastructure
  - A hash with keys matching the index of the switch and values
    containing booleans representing the state of the switch. 

Algorithm
  - Initialise the switch bank array to all false. 
  - loop n times
    - loop until counter is greater than bank size
      - toggle switch at counter position
      - Increment counter
  - Generate the return array. 
    - Do a each_pair loop, for each value of true save the key into 
      the results array. 
  -return the results array

=end
=begin
def switch_bank (bank_size)
  switch_bank = {}
  1.upto(bank_size) do |iteration_number|
    counter = iteration_number
    until counter > bank_size
      switch_bank[counter] = !switch_bank[counter]
      counter += iteration_number
    end
  end
  
  switch_bank.select { |_index, state| state }.keys
end

p switch_bank(1000)
p switch_bank(0) == []
p switch_bank(1) == [1]
p switch_bank(2) == [1]
p switch_bank(5) == [1, 4]
p switch_bank(10) == [1, 4, 9]
=end

#_____Diamonds!_____33min
=begin
Algorithm
  - put an empty line
  - loop n times
    - construct the string
      - Have a conditional that knows if you are past the half way 
        mark. 
      - Find the middle number
      - Add the appropriate number of spaces before and after the
        middle number.
=end
=begin
def diamond(size)
  puts ""
  middle = (size / 2) + 1
  1.upto(size) do |line_number|
    line_string = ""
    line_string << " " * (middle - line_number).abs
    line_string << "*" * (line_number * 2 - 1) if line_number <= middle
    line_string << "*" * (4 * middle - 1 - 2 * line_number) if line_number > middle    
    line_string << " " * (middle - line_number).abs
    puts line_string
  end
end

diamond(71)
=end

#_____Stack Machine Interpretation_____
=begin
def minilang(commands)
  register = 0
  stack = []
  results = ""
  
  command_array = commands.to_s.split
  command_array.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
      next
    end
    
    case command
    when "PUSH"
      stack << register
    when "ADD"
      register += stack.pop
    when "SUB"
      register -= stack.pop
    when "MULT"
      register *= stack.pop
    when "DIV"
      register = register / stack.pop
    when "MOD"
      register = register % stack.pop
    when "POP"
      register = stack.pop
    when "PRINT"
      results << "#{register} \n"
    end
  end
  results
end

#Test Cases
#=begin
p minilang('PRINT') == "0 \n"
p minilang('5 PUSH 3 MULT PRINT') == "15 \n"
p minilang('5 PRINT PUSH 3 PRINT ADD PRINT') == "5 \n3 \n8 \n"
p minilang('5 PUSH POP PRINT') == "5 \n"
p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') == "5 \n10 \n4 \n7 \n"
p minilang('3 PUSH PUSH 7 DIV MULT PRINT ') == "6 \n"
p minilang('4 PUSH PUSH 7 MOD MULT PRINT ') == "12 \n"
p minilang('-3 PUSH 5 SUB PRINT') == "8 \n"
p minilang('6 PUSH') == ""
#=end
=end

#_____Word to Digit_____
=begin
  input: string
  output: a new string
  
Data structure
  - Not sure, options are
    - A hash with the numbers as words as keys and the value as 
      digits. 
    - It seems better than a huge case statement, or an array. 

Algorithm
  - initalise hash
  - split the input string into an array of words
  - loop over that array
    - Use each word as a key in the hash 
    - If the word isn't a key the hash will return nil then skip
      to the next word. 
    - If the word is a key then replace it the hash value. 
  - turn the array of words into a string and return it. 
  
=end

#Version 1
=begin
def word_to_digit (sentence) 
  library = {
    zero: 0,
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9
  }
  
  result = sentence.split.map do |word|
    if library[word.match(/\w+/).to_s.to_sym] == nil 
      word
    else
      word = library[word.match(/\w+/).to_s.to_sym]
    end
  end
  
  result.join(" ")
end

#Test Case
p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
=end

#_____Fibonacci Numbers (Recursion)_____
=begin
def fibonacci(num)
  return 1 if num <= 2
  fibonacci(num - 1) + fibonacci(num - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
=end

#_____Fibonacci Numbers (Procedural)_____
=begin
def fibonacci(num)
  return 1 if num <= 2
  fib1 = 1
  fib2 = 1
  3.upto(num) do |_|
    fib1, fib2 = fib2, fib1 + fib2    
  end
  fib2
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
=end

#_____Fibonacii Numbers (Last Digit)_____
=begin
def fibonacci_last(num)
  return 1 if num <= 2
  fib1 = 1
  fib2 = 1
  3.upto(num) do |_|
    fib1, fib2 = fib2, fib1 + fib2
    fib2 %= 10 
  end
  fib2
end

#Test Cases
p fibonacci_last(15)        == 0 # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        == 5 # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       == 5 # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   == 1 # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) == 4 # -> 4
=end