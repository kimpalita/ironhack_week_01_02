require 'pry'

def division(a, b)
	begin
		c = a.to_i/b.to_i
		puts c
	rescue
		puts "cannot divide!" 
	rescue
		puts "something went wrong"
	ensure
		var
	end
end

puts "enter first number:"
first_number = gets.chomp
puts "enter second number"
second_number = gets.chomp

puts division(first_number, second_number)

