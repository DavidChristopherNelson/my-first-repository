#---Generic Greeting (Part 1)---
=begin
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
kitty.class.generic_greeting
=end

#---Hello, Chloe!---
=begin
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
=end

#---Identify Yourself (Part 1)---
=begin
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
=end

#---Generic Greeting (Part 2)---
=begin
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def self.generic_greeting
    p "Hello! I'm a cat!"
  end
  
  def personal_greeting
    p "Hello! My name is #{name}"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
=end

#---Counting Cats---
=begin
class Cat
  @@cat_number = 0
  
  def initialize
    @@cat_number += 1
  end
  
  def self.total
    p @@cat_number
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
=end

#---Colorful Cat---
=begin
class Cat
  COLOR = "purple"
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
=end

#---Identify Yourself (Part 2)---
=begin
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    "I'm #{name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty
=end

#---Public Secret---
=begin
class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret
=end

#---Private Secret---
=begin
class Person
  attr_writer :secret
  
  def share_secret
    p secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret
=end

#---Protected Secret---
class Person
  attr_writer :secret
  
  def compare_secret(other_person)
    self.secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)