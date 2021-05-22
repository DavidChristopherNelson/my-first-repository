#---Inherited Year---
=begin
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  
end

class Car < Vehicle
  
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year
=end

#---Start the Engine (Part 1)---
=begin
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  
  def initialize(year)
    super
    start_engine
  end
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
=end

#---Only Pass the Year---
=begin
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type
  
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
=end

#---Start the engine (Part 2)---
=begin
class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive fast, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
=end

#---Towable (Part 1)---
=begin
module Towable
  def tow
    p "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow
=end

#---Towable (Part 2)---
=begin
module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_accessor :year
  
  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year
=end

#---Transportation---
=begin
module Transportation
  class Vehicle
    
  end
  
  class Truck < Vehicle
    
  end
  
  class Car < Vehicle
    
  end
end

Transportation::Car.new
=end

class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

# Sponges and Corals don't have a separate move method - they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| animal.move }