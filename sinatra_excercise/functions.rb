require 'artii'
require 'pry'

class AsciiWord
	def create_ascii(my_word)
		ascii my_word
	end
end


class MathOperation
	def initialize(saved_number, new_number)
		@saved_number = saved_number
		@new_number = new_number
	end

	def add
		@total = @saved_number + @new_number
	end

	def subtract
		@total = @saved_number - @new_number
	end

	def multiply
		@total = @saved_number * @new_number
	end

	def divide
		@total = @saved_number / @new_number
		@total.round(2)
	end
end