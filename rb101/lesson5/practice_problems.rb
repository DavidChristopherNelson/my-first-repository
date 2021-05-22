#1
=begin
arr = ['10', '11', '9', '7', '8']
ordered_array = arr.sort do |a,b|
  b.to_i <=> a.to_i
end
#ordered_array = arr.sort_by do |a|
#  a.to_i
#end
p ordered_array
=end

#2
=begin
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

#books.sort! do |hash1, hash2|
#  hash1[:published].to_i <=> hash2[:published].to_i
#end

books.sort_by do |book|
  book[:publised]
end

puts books
=end

#3
=begin
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1["b"][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)
=end

#4
=begin
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[["a"]][:a][2] = 4
p hsh2
=end

#5
=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age_of_males = 0
munsters.each do |family_member|
  if family_member[1]["gender"] == "male"
    total_age_of_males += family_member[1]["age"]
  else
    next
  end
end
p total_age_of_males
=end

#6
=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}"
end
=end

#7
#[4,[3,8]]

#8
#first attempt: fails because it stops scanning for vowels 
#in a word once it finds a vowel. 
=begin
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = {a: false, e: false, i: false, o: false, u: false}
hsh.each_value do |word_array|
  word_array.each do |word|
    if word.include?("a")
      vowels[:a] = true
    elsif word.include?("e")
      vowels[:e] = true
    elsif word.include?("i")
      vowels[:i] = true
    elsif word.include?("o")
      vowels[:o] = true
    elsif word.include?("u")
      vowels[:u] = true
    end
  end
end
vowels.each do |key, value|
  if value == true
    puts key.to_s
  end
end
p vowels

#Second Attempt: Better but I like how they avoided the case
  statement. 
=begin
Problem
  Input: A hash that contains words as values.
  Output: a printout of all the vowels in the order that 
    they appear. 
  Explicit requirements
    - Detect and print out all vowels in the input.
  Questions: 
    - Can I print out the same vowel more than once? 
      - Assume yes. 
    - Does the order of the printed vowels need to match the
      input? 
      - Assume no.
    - Should the output be capitalized if the input vowel 
      is capitalized? 
      - Assume no. 
      
Test Case
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
print_vowels(hsh)
=>e u i o o u e o e e a o

Data structure
- iterate through the input hash. 

Algorithm
- Iterate over the arrays in the values of the hash.
  - Iterate over the words in the arrays.
    - Iterate over the letters in the words.
      - For each letter iteratively check it against the 
        letters in the vowel array. 
      - If it matches print the letter.
      - If it doesn't then go to the next letter. 


Code
=end
=begin
def print_vowels(input_hash)
  input_hash.each_value do |word_array|
    word_array.each do |word|
      word.chars.each do |letter|
        case letter
          when "a"
            puts "a"
          when "e"
            puts "e"
          when "i"
            puts "i"
          when "o"
            puts "o"
          when "u"
            puts "u"
        end 
      end
    end
  end
end
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
print_vowels(hsh)
=end

#9
=begin
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map do |sub_array|
  sub_array.sort! do |a, b|
    a <=> b
  end
end
p arr
=end

#10
=begin
array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
array.map do |hash|
  hash.each do |key, value|
    hash[key] = value + 1
  end
end
p array
=end

#11
=begin
array = [[2], [3, 5, 7], [9], [11, 13, 15]]
array.map do |sub_array|
  sub_array.select! do |number|
    number % 3 == 0
  end
end
p array
=end

#12
=begin
array = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
hash = {}
array.each do |item|
  hash[item[0]] = item[1]
end
p hash
=end

#13
=begin
array = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
array.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
=end

#14
=begin
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
color_and_sizes = []
hsh.each_value do |info|
  if info[:type] == 'fruit'
    info
    color_and_sizes << info[:colors].each {|color| color.capitalize!}
  elsif info[:type] == 'vegetable'
    color_and_sizes << info[:size].upcase
  end
end
p color_and_sizes
=end

#15
=begin
array = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
array.map do |item|
  item.select! do |_, value|
    value.all? { |number| number % 2 == 0 }
  end
end
p array
=end

#16
def generate_random_hex_number(length)
  letters = "abcedf"
  output = ""
  length.times do
    random_hex_number = rand(16)
    if random_hex_number > 9
      random_hex_number = letters[random_hex_number-10]
    end 
    output += random_hex_number.to_s
  end 
  output
end 

def uuid_generator
  uuid = generate_random_hex_number(8) + "-" +
        generate_random_hex_number(4) + "-" +
        generate_random_hex_number(4) + "-" +
        generate_random_hex_number(4) + "-" +
        generate_random_hex_number(12)
end
#p uuid_generator
p uuid_generator

