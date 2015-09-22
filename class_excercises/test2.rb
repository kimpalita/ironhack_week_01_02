user_input = gets.chomp


class Wannabe
	def initialize(input)
		@input = input
	end

def evaluate
	begin
	puts eval @input
	rescue
		puts "there is an error"
	end
end
end

Wannabe.new(user_input).evaluate



