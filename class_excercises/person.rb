class Person
	attr_reader :name
	attr_accessor :age

	def initialize(name, age)
		@name = name
		@age = age
	end
end

first_person = Person.new("John", 30)

puts first_person.name
puts first_person.age
