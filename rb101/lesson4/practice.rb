=begin 
7.Selection and Transformation

def select_fruit(produce_list)
  fruit_list = {}
  produce_list.each_key do |food|
    fruit_list[food] = produce_list[food] if produce_list[food] == "Fruit" 
  end
  fruit_list
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
=end

=begin
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers
=end

=begin
Problem 
  Given an array of integers return a different array with every odd index 
  number doubled. 
  
  Input: an array of integers
  Output: a different array of integers
  Rules: 
    Explicit
      - Double every number that has an odd index 
      
Test Cases
  double_odd_indices([1,2,3,4,5,6]) == [1,4,3,8,5,12]
  
Data Structure
  An array will be used to store the integers

Algorithm 
  - instantiate the new array. 
  - iterate through the input_array
  - Check if the index is odd
  - if it is then double the value found at that index
  - if it isn't then go to the next loop iteration
  - return the new array
# Code
def double_odd_indices(input_array)
  output_array = []
  for index in 0..(input_array.size - 1)
#  (input_array.size).times do |index|
    if index % 2 == 1
      output_array << input_array[index] * 2
    else 
      output_array << input_array[index]
    end
  end
  output_array
end

p double_odd_indices([1,2,3,4,5,6]) == [1,4,3,8,5,12]
p double_odd_indices([1,2,3,4,5,6])
=end
=begin
alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
=end

######### 4.11

=begin
#4.11.1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hierarchy = flintstones.to_h {|name| [name, flintstones.index(name)]}
p hierarchy
=end

=begin
#4.11.2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0
ages.each_value {|age| total_age += age}
puts total_age
=end

=begin
#4.11.3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.select! do |name, age| 
  true if age < 100
end

p ages
=end

=begin
#4.11.4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
lowest_checked_age = ages["Herman"]
ages.each_value do |age|
  lowest_checked_age = age if age < lowest_checked_age
end
p lowest_checked_age
#ages.values.min
=end

=begin
#4.11.5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
first_name_that_start_with_Be = ""
flintstones.each_index do |index|
  name = flintstones[index]
  first_name_that_start_with_Be = name if name[0,2] == "Be"
end
puts first_name_that_start_with_Be
#flintstones.index {|name| name[0, 2] == "Be"}
=end

=begin
#4.11.6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! { |name| name[0,3]}
=end

=begin
#4.11.7
statement = "The Flintstones Rock"
letter_frequency = {}
statement.each_char do |character|
  if letter_frequency[character] == nil
    letter_frequency[character] = 1
  else
    letter_frequency[character] += 1
  end
end
p letter_frequency
=end

=begin
#4.11.9
def titleize(string)
  words = string.split(" ")
  return_string = ""
  words.each do |word| 
    return_string += word[0].upcase + word[1..word.length] + " "
  end
  return_string.rstrip!
end

def titleize(string)
  string.split(" ").map! {|word| word.capitalize}.join(" ")
end

#def titleize(string)
#  string.[0].capitalize
#  index of spacestring.index(" ")
#end

words = "the flintstones rock"
p titleize(words)
=end

#4.11.10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  case info["age"]
    when 0..17
      info["age_group"] = "kid"
    when 18..64
      info["age_group"] = "adult"
    else
      info["age_group"] = "senior"
  end
end

p munsters