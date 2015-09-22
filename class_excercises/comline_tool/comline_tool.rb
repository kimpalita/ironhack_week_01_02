class Access
	def initialize
		@username = "Kim"
		@password = "open sasame"
	end

	def access_prompt
		puts "Enter username"
		username_input = gets.chomp
		puts "Enter password"
		password_input = gets.chomp
		unless username_input === @username && password_input === @password
			"Incorrect username or password"
		end
		Wordcount.new
	end

end


class WordCount
end


Access.new.access_prompt