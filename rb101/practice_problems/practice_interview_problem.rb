#_____Practice Question for Interview_____
=begin
Problem
Find the shortest contiguous subarray length whose elements add 
up to be greater than or equal to the input integer. 
  input: An array of n positive numbers and a positive integer
  output: a number

Examples
  minSubLength([2, 3, 1, 2, 4, 3], 7)

Data structure
  - I will generate all the subarrays and save them in an array. 

Algorithm
  - save all the contiguous subarrays of the input array into 
    an array called subarray_list
  - loop over subarray_list
    - if sum of subarray > input integer then save length to 
      big_enough_subarray_list. 
  - find and return the minimum element in big_enough_subarray_list


  Expanding upon this step
  - save all the contiguous subarrays of the input array into 
    an array called subarray_list
    - loop over each element in the input array
      - loop from the current element index to the end of the 
        input array. 
        - generate subarrays from those two loop indexes
        - save those subarrays into subarray_list
        
Code
=end
#____Version 1_____
=begin
def minSubLength(input_array, num)
  subarray_list = []
  input_array.each_index do |outer_index|
    outer_index.upto(input_array.length - 1) do |inner_index|
      subarray_list << input_array[outer_index..inner_index]
    end
  end
  
  big_enough_subarray_list = subarray_list.select { |subarray| subarray.sum >= num }
  big_enough_subarray_list.map! { |subarray| subarray.length }
  if big_enough_subarray_list.length > 0
    big_enough_subarray_list.min 
  else
    0
  end
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) ==4
p minSubLength([1, 2, 4], 8) == 0
=end








#____Version 2_____
#=begin
def minSubLength(input_array, num)
  subarray_list = []

  1.upto(input_array.length) do |subarray_size|
    subarray_list << input_array.each_cons(subarray_size).value
  end
  
  subarray_list
  big_enough_subarray_list = subarray_list.select { |subarray| subarray.sum >= num }
  big_enough_subarray_list.map! { |subarray| subarray.length }
  if big_enough_subarray_list.length > 0
    big_enough_subarray_list.min 
  else
    0
  end
end

p minSubLength([2, 3, 1, 2, 4, 3], 7)
#=end
=begin
p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) ==4
p minSubLength([1, 2, 4], 8) == 0
=end