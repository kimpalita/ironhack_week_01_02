#require "pry"

class UserData
	def initialize(source_file)
		@source_file = IO.read(source_file)
		@username = @source_file.split(",")[0]
		@password = @source_file.split(",")[1]
		@begin_access = AccessScreen.new(@username, @password).access_prompt
	end
end

class AccessScreen
	@@access_granted = false

	def self.access_granted
		@@access_granted
	end

	def initialize(username, password)
		@username = username
		@password = password
		@error = "Incorrect username or password"
	end

	def access_prompt
		puts "Enter username >"
		username_input = gets.chomp
		puts "Enter password >"
		password_input = gets.chomp
		if username_input === @username && password_input === @password
			puts "Access granted"
			@@access_granted = true
			puts @@access_granted
		else puts @error
		end
	end
end


class SecondScreen
	def initialize(commands)
		@commands = commands
	end

	def prompt_phrase
		puts "Enter your phrase"
		phrase = gets.chomp
		puts "Choose option: "
		option = gets.chomp
		command_to_run = @options.find{|command| command.option=option}
		command_to_run.calculate
	end

end

class CountWords
	def initialize(text)
		@text = text
	end

	def option
		"count words"
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



UserData.new("my_data.txt")

puts AccessScreen.access_granted


