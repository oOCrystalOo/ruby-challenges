add_numbers = lambda do |num1, num2|
  return num1 + num2
end

subtract_numbers = lambda do |num1, num2|
  return num1 - num2
end

def combine (m, num1, num2) 
  return m.call(num1, num2)
end

class Person
  attr_reader :name, :age
  def initialize (name, age)
    @name = name
    @age = age
  end
end

people = Array.new
people << Person.new("Ken", 28)
people << Person.new("Marco", 31)
people << Person.new("Erica", 29)
people << Person.new("Cindy", 14)

def sort_people (people, comparer)
  people.sort do |x, y|
    comparer.call(x) <=> comparer.call(y)
  end
end

sorted_people = sort_people(people, lambda { |person| person.age })
puts sorted_people.inspect