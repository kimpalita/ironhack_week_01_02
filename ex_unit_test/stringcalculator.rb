
	
class Calculator
	def add_string(a_string)
		if a_string == ""
			return 0
		end

		if a_string.include? "\n"
			number_array = a_string.split("\n").map { |x| x.to_i }
		else
			number_array = a_string.split(",").map { |x| x.to_i }
		end
		number_array.reduce(0){|sum,x| sum + x }
	end

end

=begin
	if add_string("") != 0
		puts "something went wrong!"
	end

	if add_string("4, 3") != 7
		puts "this place is too small for the both of us"
	end

	if add_string("8") != 8
		puts "one number does not work"
	end

	if add_string("3,6,7,5,6") != 27
		puts "this calculator cannot take many numbers"
	end
=end