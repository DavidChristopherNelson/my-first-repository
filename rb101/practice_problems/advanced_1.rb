require "pry"

#_____Seeing Stars_____ 36min
=begin
Problem
Create an eight pointed star. 
  Input: An odd integer
  Output: print to screen

Datastructure
  An array of strings. 
    The array represents the rows
    The string represents the lines (but I might represent this as
    an array instead).

Algorithm
  + initalise the array of strings to be all spaces.
  + find the middle number
  + loop through half of the rows
    + Use the row number to determine where the stars go
    + Assign those stars to the correct two rows
  + Do the middle row
  - loop through all the rows and print them out
=end
#Code
=begin
def star(size)
  grid = []
  middle = size / 2
  size.times do |row_number|
    grid[row_number] = " " * size
  end
  
  0.upto(middle - 1) do |row_number|
    grid[row_number][row_number] = "*"
    grid[row_number][middle] = "*"
    grid[row_number][-row_number - 1] = "*"
    grid[-row_number - 1][row_number] = "*"
    grid[-row_number - 1][middle] = "*"
    grid[-row_number - 1][-row_number - 1] = "*"
  end
  
  grid[middle] = "*" * size
  
  grid.each { |string| puts string }
end
=end

#Test Cases
#star(61)

#Extension question
#drawing a circle or any function
=begin
Problem
  Input: an odd integer representing the grid size
  Output: the graphical cartesian representation of that function

Data Structure
  An array of strings

Algorithm
  + initalise the grid
    - put the x and y axis on the grid
  + identify the middle number
  + loop through all the x values (from - middle to middle)
    + find the rounded y values for every x value
    + convert cartisian coordinates to grid points
    + assign a star to each of those points
  + display the grid
=end
# Code
=begin
def plotter(grid_size)
  grid = []
  middle = grid_size / 2
  0.upto(grid_size - 1) do |row_number|
    grid[row_number] = " " * grid_size
  end
  grid[middle] = "-" * grid_size
  0.upto(grid_size - 1) { |row_number| grid[row_number][middle] = "|" }

  (-middle + 1).upto(middle - 1) do |x|
#    y = (10 * Math.sin(x * 0.1) * Math.sin(x * 0.1)).round
    if x <= middle
      y = ((middle ** 2 - x ** 2) ** 0.5).to_i.round unless x > middle
      grid[-y + middle][x + middle] = "*" unless y > middle || y < -middle
    end 
  end
  
  (-middle + 1).upto(middle - 1) do |x|
#    y = (10 * Math.sin(x * 0.1) * Math.sin(x * 0.1)).round
    if x <= middle
      y = -((middle ** 2 - x ** 2) ** 0.5).to_i.round unless x > middle
      grid[-y + middle][x + middle] = "*" unless y > middle || y < -middle
    end 
  end
  
  grid.each { |string| puts string }
end

# Test Cases
plotter(25)
=end

#_____Transpose 3x3_____
#first incomplete attempt
=begin
INPUT: matrix (an array of arrays)
OUTPUT: the transpose of the matrix

#Data Structure
  The matrix will be an array of arrays.
  The output matrix will be a new matrix. 

#Algorithm
  - initialise the new matrix
  - loop through each element of the input matrix
    - save each element to the correct position in the new matrix
  -return the new matrix
=end
#Code
=begin
def transpose(matrix)
  transpose = []
  
  
  matrix.size.times do |index_1|
    transpose << []
    matrix[index_1].size.times do |index_2|
      transpose[index_1] << []
      #binding.pry
      transpose[index_2][index_1] << matrix[index_1][index_2]
    end
  end
  transpose
end

#Test Case
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
#p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
=end

#_____Transpose 3x3_____ 35min because I didn't know how to make clones. 
=begin
Problem
  INPUT: an array
  OUTPUT: an array
  Return the transpose of the matrix. That is do 
  array[a, b] = array[b, a] for every element in the matrix.

Datastructure
  Represent the matrix as an array of arrays. I need to 
  return a new array. 

Algorithm
  version1
  + loop through each sub array with index
    + loop through each element with index
      - if the outer index is greater than the inner index
        - swap elements
  + return the matrix
  
  version2
  - Create a copy of the input matrix
  + loop through each sub array with index
    + loop through each element with index
      + if the outer index is greater than the inner index
        + swap elements
  + return the newmatrix
=end
# Code
=begin
def transpose(matrix)
  new_matrix = matrix.map { |subarray| subarray.clone }
  matrix.each_index do |outer_index|
    matrix[outer_index].each_index do |inner_index|
      if outer_index > inner_index
        new_matrix[inner_index][outer_index] = matrix[outer_index][inner_index]
        new_matrix[outer_index][inner_index] = matrix[inner_index][outer_index]
      end
    end
  end
  new_matrix
end


# Test Cases
#=begin
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

#p transpose(matrix)
new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
#=end
=end

#_____Transpose MxN_____ 18:27
=begin
Problem
  INPUT: a matrix (array of arrays)
  OUTPUT: a matrix
  Return the transpose of the input matrix. 

Datastructure
  Use an array of arrays to represent a matrix.

Algorithm
  + Create an empty array with the correct number of rows
    + find the input matrix number of columns
    + loop that many times adding an empty array to the new 
      array
  + loop through the rows of the input matrix
    + loop through the elements of each row
      + add that element to the correct row
  + return the new matrix

=end
# Code
=begin
def transpose(matrix)
  new_matrix = []
  matrix[0].size.times { |_| new_matrix << [] }
  
  matrix.each_index do |row_index|
    matrix[row_index].each_index do |column_index|
      new_matrix[column_index] << matrix[row_index][column_index]
    end
  end
  new_matrix
end

# Test Cases
#p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
#=begin
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
#=end
=end

#_____Rotating Matrices_____1:50
=begin
Problem
  INPUT: an array (representing a matrix)
  OUTPUT: the same array mutated
  Rotate the elements in the array according to the pattern
  described in the question. Focus on a 3x3 matrix first.

Datastructure
  Represent the matrix with an array of arrays.

Algorithm
  + Create a new empty matrix of the correct dimensions
  + Create a location matrix
  + loop through the input matrix rows
    + loop through the input matrix columns
      - Assign the value of the element to the new matrix using
        the index values saved in the location matrix. 
  + return the new matrix
=end
# Code
=begin
def rotate90(matrix) 
  result_matrix = [[[], [], []], [[], [], []], [[], [], []]]
  new_locations = [[[0, 2], [1, 2], [2, 2]], [[0, 1], [1, 1], [2, 1]], [[0, 0], [1, 0], [2, 0]]]
  
  matrix.each_index do |row_index|
    matrix[row_index].each_index do |column_index|
      location = new_locations[row_index][column_index]
      result_matrix[location[0]][location[1]] = matrix[row_index][column_index]
    end
  end
  
  result_matrix
end

# Test Cases

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix1 = rotate90(matrix1)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix1
=end
=begin
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
=end

#Attempt 2
=begin
Algorithm
  #- Get the outer ring
  + Assign the elements in the outer ring into a new array called ring.  
    (Keep the order as if you were unravelling the ring into a line.)
    + Start at [0, 0]
    + increment the second index until index = matrix_dimension[1] - 1
    + then increment the first index until index = matrix_dimension[0] - 1
    + then decrease the increment of the second index until 0
    + then decrease the increment of the first index until 1
  + Pop and shift the correct number of elements in the new array.
    + pop and shift the number of rows minus one times
  - ring
    
=end
=begin
def rotate90(matrix)
  number_of_rows = matrix.size
  matrix_dimension = [matrix.size, matrix[0].size]
  return_matrix = [[[], []], [[], []], [[], []], [[], []]]
  
  ring = []
  index_1 = 0
  index_2 = 0
  ring << matrix[index_1][index_2]
  (matrix_dimension[1] - 1).times do |_|
    index_2 += 1
    ring << matrix[index_1][index_2]
  end
  (matrix_dimension[0] - 1).times do |_|
    index_1 += 1
    ring << matrix[index_1][index_2]
  end
  (matrix_dimension[1] - 1).times do |_|
    index_2 -= 1
    ring << matrix[index_1][index_2]
  end
  (matrix_dimension[0] - 1).times do |_|
    index_1 -= 1
    ring << matrix[index_1][index_2]
  end
  ring.pop
  
  (matrix_dimension[0] - 1).times do |_|
    ring.unshift(ring.pop)
  end

  index_1 = 0
  index_2 = 0
  matrix[index_1][index_2] = ring.shift
  (matrix_dimension[0] - 1).times do |_|
    index_2 += 1
    matrix[index_1][index_2] = ring.shift
  end
  (matrix_dimension[1] - 1).times do |_|
    index_1 += 1
    matrix[index_1][index_2] = ring.shift
  end
  (matrix_dimension[0] - 1).times do |_|
    index_2 -= 1
    matrix[index_1][index_2] = ring.shift
  end
  (matrix_dimension[1] - 2).times do |_|
    index_1 -= 1
    matrix[index_1][index_2] = ring.shift
  end
  
  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p new_matrix1 = rotate90(matrix2)
#p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
=end

#_____Fix the Bug_____
=begin
def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
=end

#_____Merge Sorted Lists_____30min
=begin
Problem
INPUT: two arrays
OUTPUT: one array
  Return a sorted array containing all elements of the two input arrays which are sorted. 

Datastructure
  A newresult array which gets added to element by element after a conditional has been evaluated

Algorithm
  + Create variable for the index of both arrays
  + Create the return array
  + loop
    + Compare the indexed element of both arrays
      + if the element from array one is lower then
        + add it to the return array
        + remove it from array one 
        + increment the array one index
      + if the element from array two is lower then
        + add it to the return array
        + remove it from array two 
        + increment the array two index
    - if array one index is larger than array one then 
      - add all remaining elements from array two into the return array
      - break
    - if array two index is larger than array two then 
      - add all remaining elements from array one into the return array
      - break
  + return the return array
=end
# Code
=begin
def merge(arr1, arr2)
  result_arr = []
  
  loop do
    if arr1.size <= 0
      arr2.each { |element| result_arr << element }
      break
    elsif arr2.size <= 0
      arr1.each { |element| result_arr << element }
      break
    end
    if arr1[0] < arr2[0]
      result_arr << arr1.shift
    elsif arr1[0] > arr2[0]
      result_arr << arr2.shift
    end
  end
  result_arr
end

# Test Cases
#p merge([1, 5, 9], [2, 6, 8])
#=begin
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
#=end
=end

#_____Merge Sort_____ 25min
=begin
def merge_sort(array)
  return array if array.size == 1
  subarray_1 = array[0...array.size / 2]
  subarray_2 = array[array.size / 2 ..-1]
  subarray_1 = merge_sort(subarray_1)
  subarray_2 = merge_sort(subarray_2)
  merge(subarray_1, subarray_2)
end

def merge(array_1, array_2)
  return_array = []
  loop do 
    if array_1.size <= 0 
      return_array << array_2
      return_array.flatten!
      break
    elsif array_2.size <= 0
      return_array << array_1
      return_array.flatten!
      break
    end
    
    if array_1[0] <= array_2[0]
      return_array << array_1.shift
    else
      return_array << array_2.shift
    end
  end
  return_array
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
=end

#_____Egyptian Fractions_____ 18min
=begin
def egyptian(target)
  denominator_list = []
  sum = 0
  denominator = 1
  until sum == target
    sum += Rational(1, denominator)
    if sum <= target
      denominator_list << denominator
    else
      sum -= Rational(1, denominator)
    end
    denominator += 1
  end
  denominator_list
end

def unegyptian(denominator_list)
  sum = 0
  denominator_list.each do |denominator|
    sum += 1.0 / denominator
  end
  sum
end

p egyptian(Rational(2, 1))    == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
=end