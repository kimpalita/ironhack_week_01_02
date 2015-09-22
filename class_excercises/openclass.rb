require 'pry'

class MagicObject

	def initialize
		@my_hash = {}
	end

	def method_missing(m, *args, &block)
		#binding.pry
		@my_hash[m] = args #if statement for arguments
		puts @my_hash
	end
end

m = MagicObject.new
m.thing 8
m.eadfadf 9



