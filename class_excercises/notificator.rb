class User
	attr_accessor :name, :email, :twitter, :facebook

	def initialize(name, email, twitter, facebook)
		@name = name
		@email = email
		@twitter = twitter
		@facebook = facebook
	end
end

class NotificatorFactory
	def self.for_user(user)
			if user.email != nil
				Email.new
			elsif user.twitter !=nil
				Twitter.new
			elsif user.facebook != nil
				Facebook.new
			else puts "Cannot contact this user"
		end
	end
end

class Email
	def send_message(message)
		puts "I'm notifying you by EMAIL: #{message}"
	end
end

class Twitter
	def send_message(message)
		puts "I'm notifying you by TWITTER: #{message}"
	end
end

class Facebook
	def send_message(message)
		puts "I'm notifying you by FACEBOOK: #{message}"
	end
end

kim = User.new("Kim", "my_email", "my_twitter", nil)

NotificatorFactory.for_user(kim).send_message("Hello!")


