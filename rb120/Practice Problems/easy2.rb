#---Fix the Program - Mailable---
=begin
module Mailable
  attr_reader :name, :address, :city, :state, :zipcode
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
end

class Employee
  include Mailable
end

betty = Customer.new 
bob = Employee.new
betty.print_address
bob.print_address
=end

#---Fix the Program - Drivable---
=begin
module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
=end

#---Complete the program - houses---
=begin
class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end
  
  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1
=end

#---Reverse Engineering---
=begin
class Transform  
  def initialize(string)
    @content = string
  end
  
  def uppercase
    @content.upcase
  end  
  
  def self.lowercase(string)
    string.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
=end

#---What Will This Do?---
=begin
class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata
=end

#---Comparing Wallets---
=begin
class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
  
  protected
  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end
=end

#---Pet Shelter---
=begin
class Pet
  attr_accessor :animal, :name
  
  def initialize(animal_type, name)
    @animal = animal_type
    @name = name
  end
  
  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_accessor :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
  def add_pet(pet)
    @pets << pet
  end
  
  def number_of_pets
    pets.size
  end
  
  def print_pets
    puts pets
  end
end

class Shelter  
  def initialize
    @owners = []
    @unadopted_pets = []
  end
  
  def adopt(owner, pet)
    if @unadopted_pets.include?(pet)
      owner.add_pet(pet)
      @unadopted_pets.delete(pet)
      @owners << owner unless @owners.include?(owner)
    else
      puts "That pet isn't in this shelter so you can't adopt it."
    end
  end
  
  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      puts "#{owner.print_pets}"
    end
  end
  
  def add_pet(pet)
    @unadopted_pets << pet
  end
  
  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    puts @unadopted_pets
  end
end

bob = Owner.new("Bob")
shelter = Shelter.new
asta = Pet.new("dog", "Asta")
shelter.add_pet(asta)
shelter.adopt(bob, asta)
shelter.add_pet(Pet.new("dog", "Laddie"))
shelter.add_pet(Pet.new("cat", "Fluffy"))
shelter.add_pet(Pet.new("cat", "Kat"))
shelter.add_pet(Pet.new("cat", "Ben"))
shelter.add_pet(Pet.new("parakeet", "Chatterbox"))
shelter.add_pet(Pet.new("parakeet", "Bluebell"))
shelter.print_unadopted_pets
=end

#---Fix The Program - Expander---
=begin
class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
=end

#---Moving---
=begin
module Movable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
=end

#---Nobility---
module Movable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  include Movable
  attr_reader :title
  def initialize(name, title)
    super(name)
    @title = title
  end
  
  def name
    "#{@title} #{@name}"
  end
  
  private
  
  def gait
    "struts"
  end
end

class Cat
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Noble.new("Mike", "King")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"