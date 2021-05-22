#---Choose the Right Method---
=begin
class Person
  attr_accessor :name, :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name
=end

#---Access Denied---
=begin
class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number
=end

#---Comparing Names---
=begin
class Person
  attr_accessor :first_name
  attr_writer :last_name
  
  def first_equals_last?
    first_name == last_name
  end
  
  private
  
  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?
=end

#---Who is Older?---
=begin
class Person
  attr_writer :age
  def older_than?(other)
    age > other.age
  end
  
  protected
  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)
=end

#---Guaranteed Formatting---
=begin
class Person
  attr_reader :name
  
  def name=(name)
    @name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
=end

#---Prefix the Name---
=begin
class Person
  attr_writer :name
  
  def name
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name
=end

#---Avoid Mutation---
=begin
class Person
  def initialize(name)
    @name = name
  end
  
  def name
    @name.dup
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
=end

#---Calculated Age---
=begin
class Person
  def age=(new_age)
    @age = double(new_age)
  end
  
  def age
    double(@age)
  end
  
  private
  
  def double(number)
    number * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age
=end

#---Unexpected Change---
=begin
class Person
  def name=(full_name)
    @first_name = full_name.split(" ").first
    @last_name = full_name.split(" ").last
  end
  
  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
=end