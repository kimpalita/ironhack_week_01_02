class UserInput
	def prompt_user
		puts "Enter your phrase"
		phrase = gets.chomp
		puts "Choose option: count words, count letters, reverse text"
		option = gets.chomp

		case option
		when "count words"
			CountWords.new(phrase).calculate
		when "count letters"
			CountLetters.new(phrase).calculate
		when "reverse text"
			ReverseText.new(phrase).calculate
		else puts "Invalid option"
		end
	end
end

class CountWords
	def initialize(text)
		@text = text
	end

	def calculate
		words = @text.split(" ")
		puts words.length
	end
end


class CountLetters
	def initialize(text)
		@text = text
	end

	def calculate
		puts @text.length
	end
end


class ReverseText
	def initialize(text)
		@text = text
	end

	def calculate
		puts @text.reverse
	end
end


UserInput.new.prompt_user