require 'pry'

#_____Short Long Short_____
=begin
def short_long_short(string1, string2)
  return string1 + string2 + string1 if string1.length < string2.length
  string2 + string1 + string2
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
=end

#_____What Century is That?_____
=begin
Algorithm
  - loop through all the centuries starting from the first century. 
  
=end
=begin
def century(year)
  century_number = 0
  while (century_number * 100) < year
    century_number += 1
  end
  
  case century_number % 10
  when 1
    suffix = "st"
  when 2
    suffix = "nd"
  when 3
    suffix = "rd"
  else
    suffix = "th"
  end
  
  case century_number % 100
  when 11, 12, 13
    suffix = "th"
  end 
  
  century_number.to_s + suffix
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
=end 

#_____Leap Years (Part 1)_____
# Version 1
=begin
def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        return true
      end
      return false
    end
    return true
  end
  false
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
=end
=begin
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
=end

#_____Leap Years (Part 2)_____
=begin
def leap_year?(year)
  if year >= 1752
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  else
    if year % 4 == 0
      true
    else
      false
    end
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
=end

#_____Multiples of 3 and 5_____
=begin
Algorithm
  - loop input number of times incrementing a counter by one each time
  - check if the counter is a multiple of 3
  Check if number is a multiple of 3
  -
=end

# Version 1
=begin
def multisum(top_bound)
  sum = 0
  top_bound.times do |number|
    if ((number + 1) % 3 == 0) || ((number + 1) % 5 == 0)
      sum += number + 1
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
=end

#_____Running Totals_____
# Version 1
=begin
def running_total(array)
  output_array = []
  array.each_index do |index|
    if index == 0
      output_array << array[index]
    elsif index > 0 
      output_array << array[index] + output_array[index - 1]
    end
  end
  output_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
=end

# Version 2
=begin
def running_total(array)
  sum = 0
  array.map { |element| sum += element }
end
=end

#_____Convert a String to a Number!_____
=begin
Algorithm
  - break the string into an array containing each character of
    the string. 
  - Loop through the array
    - Use a case statement to match the string to its numerical 
      counterpart. 
    - multiply the number by 10 ** loop iteration number and add
      it to the output number. 
  - return the output number.  
=end

# Version 1
=begin
def string_to_integer(string)
  characters = string.split("")
  digit = 0
  return_number = 0
  
  characters.each_index do |index|
    case characters[index]
    when "0" then digit = 0
    when "1" then digit = 1
    when "2" then digit = 2
    when "3" then digit = 3
    when "4" then digit = 4
    when "5" then digit = 5
    when "6" then digit = 6
    when "7" then digit = 7
    when "8" then digit = 8
    when "9" then digit = 9
    end
    return_number += digit * (10 ** (characters.length - 1 - index))
  end
  
  return_number
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
=end

# Version 2
=begin
DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  
  value = 0
  digits.each { |digit| value = value * 10 + digit }
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
=end

#_____Convert a String to a Signed Number!_____
=begin
Algorithm
  - Identify the first digit
    - if it is a number then pass the string to string_to_integer
    - if it is a + then remove that and pass the string to 
      string_to_integer
    - if it is a - then remove that and pass the string to 
      string_to_integer and multiply the return value by -1. 
=end

=begin
DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each do |digit| 
    value = value * 10 + digit
  end
  value
end

def string_to_signed_integer(string)
  case string[0]
  when "+" then string_to_integer(string[1..-1])
  when "-" then -string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
=end

#_____Convert a Number to a String!_____
=begin
DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9
}

def integer_to_string(number)
  # Deal with the 0 edge case
  return "0" if number == 0
  
  # Get an array of digits
  digits = []
  while number > 0
    digits.prepend(number % 10)
    number /= 10
  end
  
  result = ""
  digits.each do |digit|
    result += DIGITS.key(digit)
  end
  
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
=end

#_____Convert a Signed Number to a String!_____
DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9
}

def signed_integer_to_string(number)
  # Deal with the 0 edge case
  return "0" if number == 0
  
  # Get an array of digits
  digits = []
  
  if number > 0
    while number > 0
      digits.prepend(number % 10)
      number /= 10
    end
    
    result = ""
    digits.each do |digit|
      result += DIGITS.key(digit)
    end
    result = "+" + result
  else
    number *= -1
    while number > 0
      digits.prepend(number % 10)
      number /= 10
    end
    
    result = ""
    digits.each do |digit|
      result += DIGITS.key(digit)
    end
    result = "-" + result
  end
  result
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'