require 'pry'
#_____Combine Two Lists_____
=begin
def interleave(array1, array2)
  return_array = []
  array1.length.times do |index|
    return_array << array1[index]
    return_array << array2[index]
  end
  return_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=end

#_____Lettercase Counter_____
=begin
def letter_case_count(text)
  uppercase_counter = text.count('A-Z')
  lowercase_counter = text.count('a-z')
  neither = text.length - uppercase_counter - lowercase_counter
  return_hash = {
    lowercase: lowercase_counter,
    uppercase: uppercase_counter,
    neither: neither
  }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
=end

#_____Capitalize Words_____
=begin
def word_cap(text)
  words = text.split(" ")
  words.each do |word| 
    word.downcase!
    word[0] = word[0].upcase!
  end
  words.join(" ")  
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

#p word_cap('four score and seven') 
#p word_cap('the javaScript language') 
#p word_cap('this is a "quoted" word') 
=end

#_____Swap Case_____(need regex)
=begin
def swapcase(text)
  text.length.times do |index|
    text[index].downcase! if text[index] =.include?(/[A-Z]/)
    text[index].upcase! if text[index].include?(/[a-z]/)
  end
end
=end

#_____Staggered Caps (Part 1)_____
=begin
def staggered_case(text)
  return_text = ""
  text.size.times do |index|
    if index.even?
      return_text << text[index].upcase
    else
      return_text << text[index].downcase
    end
  end
  return_text
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
=end

#_____Staggered Caps (Part 2)_____
=begin
def staggered_case(text)
  need_caps = true
  return_text = ""
  text.chars.each do |char|
    if char =~ /[^A-Za-z]/i
      return_text << char
    elsif need_caps
      return_text << char.upcase
      need_caps = false
    else
      return_text << char.downcase
      need_caps = true
    end
  end
  return_text
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
=end

#_____Multiplicative Average_____
=begin
def show_multiplicative_average(array)
  product = 1
  array.each { |element| product *= element }
  (product/array.size.to_f).round(3)
end

p show_multiplicative_average([3, 5])                == 7.500
p show_multiplicative_average([6])                   == 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == 28361.667
=end

#_____Multiply Lists_____
=begin
def multiply_list(list1, list2)
  list1.zip(list2).map { |subarray| subarray[0] * subarray[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
=end

#_____Multiply All Pairs_____
=begin
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |element_1|
    array_2.each do |element_2|
      products << element_1 * element_2
    end
  end
  products.sort()
end
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
=end

#_____The End Is Near But Not Here_____
=begin
def penultimate(text) 
  text.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
=end