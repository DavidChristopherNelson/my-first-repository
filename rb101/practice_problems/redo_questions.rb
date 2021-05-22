#_____Easy 1 Reverse It (Part 2)_____17:22
=begin
Problem
  INPUT: String
  OUTPUT: String
  
Datastructure
  - Split the string into an array of words then join the array
    elements into a string to create the return array. 

Algorithm
  + Create an array of words
  + Loop through the array with map
    + if the word is larger than five
      + Add the letters in reverse order to the string that 
        gets returned from the block.
    + else return that word
  + join and return the array of words
=end

# Code
=begin
def reverse_words(string)
  words = string.split(" ")
  words.map! do |word|
    if word.size > 4
      new_word = ""
      word.split("").reverse_each do |char|
        new_word = new_word + char
      end
      new_word
    else
      word
    end
  end  
  words.join(" ")
end

# Test Cases
#=begin
puts reverse_words('Professional')          == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School')         == "hcnuaL loohcS"
#=end
=end

#_____Sum of Digits_____ 1:48
=begin
def sum (num)
  sum = 0
  num.to_s.split("").each do |digit|
    sum += digit.to_i
  end
  sum
end

# Test Cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end

#_____Greeting a user_____4:17
=begin
print "What is your name? "
name = gets.chomp
if name[-1] == "!"
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end
=end

#_____Easy 3 Counting the number of characters_____4min
=begin
print "Please write a word or multiple words: "
string = gets.chomp
string.delete!(" ")
puts "There are #{string.size} characters in \"#{string}\""
=end

#____Easy 5 After Midnight (Part 1)_____
=begin
# Problem
  INPUT: integer
  OUTPUT: string

Datastructure

Algorithm
  - divmod
=end

# Code
=begin
def time_of_day(time)
  hours, minutes = time.divmod(60)
  hours = hours % 24
  "#{hours}:#{minutes}"
end

# Test Cases
#p time_of_day(-3) #== "23:57"
#=begin
p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"
#=end
=end

#_____Clean up the words_____
=begin
def cleanup(sentence)
  sentence.gsub(/[^a-z]/i, " ").squeeze(" ")
end

p cleanup("---what's my +*& line?") == ' what s my line '
=end

#_____Reversed Arrays (Part 1)_____
=begin
def reverse!(list)
  reversed_list = []
  list.reverse_each do |item|
    reversed_list << item
  end
  
  reversed_list.each_index do |index|
    list[index] = reversed_list[index]
  end
  
end

p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
=end

#_____Double Doubles_____
=begin
def twice(num)
  half = num.to_s.size / 2
  if num.to_s.size.even?
    if num.to_s[0..(half - 1)] == num.to_s[half..-1]
      return num
    end
  end
  num * 2
end

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
=end

#_____Grocery List_____
=begin
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

# Test Case
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end
  
#_____Longest Sentence_____
=begin
def longest_sentence(string)
  longest_sentence = ""
  num_words = 0
  sentences = string.split(/[\.\!\?]/)
  
  sentences.each do |sentence|
    if sentence.split(" ").size > num_words
      longest_sentence = sentence
      num_words = sentence.split(" ").size
    end
  end
  
  puts "The longest sentence contains #{num_words} and is 
    #{longest_sentence}"
end

# Test Case
string = "Four score and seven years ago our fathers brought forth
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
earth."
longest_sentence(string)
=end

def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
p test(a)

