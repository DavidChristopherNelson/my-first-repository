#---Banner Class---
=begin
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{"-" * (@message.length + 2)}+"
  end

  def empty_line
    "|#{" " * (@message.length + 2)}|"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
=end

#---What's the Output?---
=begin
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
=end

#---Fix the Program - Books (Part 1)---
=begin
class Book
  def title
    @title
  end
  
  def author
    @author
  end
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
=end

#---Fix the Program - Books (Part 2)---
=begin
class Book
  attr_accessor :author, :title
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
=end

#---Fix the Program - Persons---
=begin
class Person
  attr_reader :first_name, :last_name
  
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
  
  def first_name=(new_first_name)
    @first_name = new_first_name.capitalize
  end  
  
  def last_name=(new_last_name)
    @last_name = new_last_name.capitalize
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person
=end

#---Fix the Program - Flight Data---
=begin
class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
=end

#---Buggy Code - Car Mileage---
=begin
class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = @mileage + miles
    @mileage = total
  end

  def print_mileage
    puts @mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678
=end

#---Rectangles and Squares---
=begin
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length)
    super(length, length)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
=end

#---Complete the Program - Cats!---
=begin
class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
  
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end
  
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
=end

#---Refactoring Vehicles---
=begin
class Vehicle
  attr_reader :make, :model
  attr_reader :wheels
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def initialize(make, model)
    super
    @wheels = 4
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    super
    @wheels = 2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
    @wheels = 6
  end
end
=end