class Cat
  attr_accessor :name, :age
  
  def initialize (name, age)
    @name = name
    @age = age
  end
  
  def output
    puts "The name of this cat is #{@name}. It is #{@age}."
  end
end

cat = Cat.new('Oreo', 7)
cat.output
