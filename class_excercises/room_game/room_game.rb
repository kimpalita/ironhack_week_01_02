class Dungeon
	def initialize(rooms)
		@rooms = rooms
	end

	def start_dungeon
		@rooms.each do |room|
			puts "You are in a dark room. Exit to: #{room}"
			print "Enter order >"
			order = gets.chomp.upcase
			if order != room
				puts "order not valid"
				redo
			end
		end
		puts "Congratulations, you are free!"
	end
end


first_dungeon = Dungeon.new(['N', 'E', 'S', 'E', 'E', 'S', 'W'])
first_dungeon.start_dungeon