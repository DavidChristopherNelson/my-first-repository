#---Find the Class---
=begin
puts "Hello".class
puts 5.class
puts [1, 2, 3].class
=end

#---Create the Class
=begin
class Cat
end
=end

#---Create the Object---
=begin
class Cat
end

kitty = Cat.new
=end

#---What are you?---
=begin
class Cat
  def initialize
    p "I'm a cat!"
  end
end

kitty = Cat.new
=end

#---Hello, Sohpie! Part 1---
=begin
class Cat
  def initialize(name)
    @name = name
    p "Hello! My name is #{@name}"
  end
end

kitty = Cat.new('Sophie')
=end

#---Hello, Sohpie! Part 2---
=begin
class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    p "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')
p kitty.name
=end

#---Writer/Accessor---
=begin
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
=end

#---Walk the cat---
module Walkable
  def walk
    p "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.walk