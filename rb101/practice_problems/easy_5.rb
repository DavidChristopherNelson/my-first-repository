#_____ASCII String Value_____
=begin
def ascii_value(string)
  sum = 0
  string.chars.each { |character| sum += character.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
=end

#_____After Midnight (Part 1)_____
=begin
def time_of_day(time)
  time %= (60*24)
  hours, minutes = time.divmod(60)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(12)
p time_of_day(222222)
=end

#_____After Midnight (Part 2)_____
=begin
def after_midnight(time)
  hours = time[0..1].to_i
  minutes = time[3..4].to_i
  return 0 if hours == 24
  hours * 60 + minutes
end

def before_midnight(time)
  hours = time[0..1].to_i
  minutes = time[3..4].to_i
  return 0 if hours == 24
  return 0 if hours == 0 && minutes == 0
  60 * 24 - (hours * 60 + minutes)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
=end

#_____Letter Swap_____
=begin
Algorithm
  - Make an array containing all the words in the string as elements
  - Loop through the array
    - Get the first and last letter of every word. 
    - Allocate the first letter to the last position and vis versa.
  - Convert the array into a string and return it. 
=end

=begin
def swap(sentence)
  words = sentence.split(" ")
  words.map! do |word|
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  words.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
=end

#_____Clean up the words_____
=begin
def cleanup(dirty_string)
  dirty_string.gsub(/[^a-z]/i, " ").squeeze(' ')
end

p cleanup("---what's my +*& line?") 
=end

#_____Letter Counter (Part 1)_____
#_____Version 1_____
=begin
def word_sizes(sentence)
  word_lengths_hash = {}
  word_lengths_array = sentence.split(" ").map { |word| word.length }
  word_lengths_array.each do |word_length|
    if word_lengths_hash[word_length] == nil
      word_lengths_hash[word_length] = 1
    else
      word_lengths_hash[word_length] += 1
    end
  end
  word_lengths_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
=end

#_____Letter Counter (Part 2)_____
=begin
def word_sizes(sentence)
  word_lengths_hash = {}
  word_lengths_array = sentence.split(" ").map do |word| 
    word.delete('^A-Za-z').length
  end
  word_lengths_array.each do |word_length|
    if word_lengths_hash[word_length] == nil
      word_lengths_hash[word_length] = 1
    else
      word_lengths_hash[word_length] += 1
    end
  end
  word_lengths_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
=end

#_____Alphabetical Numbers_____
=begin
NUM_TO_WORD = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

def alphabetic_number_sort(num_array)
  word_array = num_array.map { |num| NUM_TO_WORD[num] }
  word_array.sort! { |word1, word2| word1 <=> word2 }
  word_array.map { |word| NUM_TO_WORD.key(word) }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

#_____ddaaiillyy ddoouubbllee_____
=begin
def crunch(doubled_words)
  crunched_words = ""
  char_array = doubled_words.chars
  char_array.each_index do |index| 
    if index == 0
      crunched_words << char_array[index]
    elsif char_array[index] != char_array[index - 1] 
      crunched_words << char_array[index]
    end
  end
  crunched_words
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
=end

#_____Bannerizer_____
def print_in_box(text)
  text.length
  horizontal_line = "+"
  (text.length + 4).times { |_| horizontal_line << "-" }
  horizontal_line << "+"
  
  padding = "|"
  (text.length + 4).times { |_| padding << " " }
  padding << "|"
  
  text_line = "|  " + text + "  |"
  
  puts horizontal_line
  puts padding
  puts text_line
  puts padding
  puts horizontal_line  
end

print_in_box('To boldly go where no one has gone before.')
