#_____Cute Angles_____
=begin
Algorithm
  - input_float % 1 => to get degrees
  - remainder % 1/60 => to get minutes
  - remainder % 1/60 => to get seconds
  - Concatenate and return output string
=end
# Version 1
=begin
def dms(angle)
  degrees = angle.to_i
  minutes = ((angle - degrees) * 60).to_i
  seconds = ((angle - degrees - minutes / 60.0) * 60.0 * 60.0).to_i
  "%(#{degrees}°#{minutes}'#{seconds}\")"
  format(02d\xC2\xB002d,02d
end
=end

# Version 2
=begin
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE

def dms(angle)
  degrees, remaining_minutes = angle.divmod(1)
  minutes, remaining_seconds = (remaining_minutes * MINUTES_PER_DEGREE).divmod(1)
  seconds, _ = (remaining_seconds * SECONDS_PER_MINUTE).divmod(1)
  format(%02d%02d, minutes, seconds)
  p degrees
  p minutes
  p seconds
end

dms(76.73)
=end

#_____Delete vowels_____
=begin
def remove_vowels(string_array)
  string_array.map do |string| 
    string.gsub(/[aeiouAEIOU]/, "")
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

#_____Fibonacci Number Location By Length_____
=begin
Algorithm
  - Instantiate the first two fib_nums
  - loop until Fib_num is larger than 10 ** (length - 1)
  - reallocate fib_num variables
  - Generate the next Fib_num

=end

#_____Version 1_____
=begin
def find_fibonacci_index_by_length(length)
  fib_num1 = 1
  fib_num2 = 1
  fib_num3 = fib_num1 + fib_num2
  index = 3
  
  while fib_num3 < 10 ** (length - 1)
    fib_num1 = fib_num2
    fib_num2 = fib_num3
    fib_num3 = fib_num1 + fib_num2
    index += 1
  end
  
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
=end

#_____Reversed Arrays (Part 1)_____
=begin
def reverse!(array)
  front_index = 0
  back_index = -1
  
  while front_index < (array.size / 2)
    array[front_index], array[back_index] = array[back_index], array[front_index]
    front_index += 1
    back_index -= 1
  end
  nil
end

list = [1,2,3,4]
p reverse!(list)
p list
=end

#_____Reversed Arrays (Part 2)_____
#Version 1
=begin
def reverse(array)
  reverse_array = []
  array.each_index do |index|
    reverse_array << array[-index - 1]
  end
  reverse_array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
=end

#_____Combining Arrays_____
=begin
def merge(array1, array2)
  return_array = array1
  array2.each do |element|
    return_array << element unless return_array.any?(element)
  end
  return_array
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
=end

#_____Halvsies_____
=begin
def halvsies(array)
  first_half = array[0..((array.size/2.0).round - 1)]
  second_half = array[((array.size/2.0).round)..array.size]
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
=end

#_____Find the Duplicate_____
=begin
def find_dup(array)
  array.each_index do |index1|
    array.each do |index2|
      return array[index1] if (array[index1] == array[index2]) && (index1 != index2)
    end
  end
  puts "No duplicate found"
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
=end

#_____Does My List Include This?_____
=begin
def include?(array, search_term)
  array.each { |element| return true if search_term == element }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
=end

#_____Right Triangles_____
=begin
def triangle(num_of_rows)
  num_of_rows.times do |row_number|
    num_of_spaces = num_of_rows - row_number - 1
    num_of_stars = num_of_rows - num_of_spaces
    puts "#{' ' * num_of_spaces}#{"*" * num_of_stars}"
  end
end

triangle(30)
=end