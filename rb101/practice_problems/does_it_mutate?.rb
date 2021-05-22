#Parameter needs to be of the form class.method(arguments)
=begin
def does_it_mutate?(input_method)
  class = input_method 
  method = input_method
  arguments = input_method
  class.send method, arguments.to_s
end
=end

# Test objects
string_object = "I am a string"
array_object = ["I", "am", "an", "array"]
hash_object = {
  description: "A hash object",
  introduction: "I am a hash",
  type: "hash"
}


potentially_mutated_array = array_object
potentially_mutated_array.uniq
if potentially_mutated_array == array_object
  puts "This method mutates the caller"
  puts potentially_mutated_array
  puts array_object
else
  puts "This method does not mutate the caller"
end