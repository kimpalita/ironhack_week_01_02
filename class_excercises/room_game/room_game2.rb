class Dungeon
	def initialize(rooms)
		@rooms = rooms
	end

	def start_dungeon
		@rooms.each do |room|
			puts room.description
			print "Possible commands: #{room.door[0].upcase}, #{room.command} >"
			order = gets.chomp.upcase
			if order != room.door[0]
				if order === room.command
					puts room.message
					if room.effect === 0
						redo
					elsif room.effect === 1
						puts "GAME OVER"
						break
					else next
					end

				else puts "Invalid order! Please try again"
				redo
			end
			end
		end
		puts "Congratulations! You are free to go!"
	end
end

class Room
	attr_accessor :description
	attr_accessor :door
	attr_accessor :command
	attr_accessor :effect
	attr_accessor :message

	def initialize(door, command, effect)
		@door = door
		@command = command
		@effect = effect
	end
end

room_one = Room.new("North", nil, nil)
room_one.description = "You are in a dark room. There is a door to the #{room_one.door}."

room_two = Room.new("South", "JUMP", 1)
room_two.description = "You are in a dimly lit room. There is a door to the #{room_two.door}."
room_two.message = "You fall and break your leg."

room_three = Room.new("West", nil, nil)
room_three.description = "You are in another dark room. There is a door to the #{room_three.door}."

room_four = Room.new("East", "SING", 0)
room_four.description = "Your are in a forest. The exit is at the #{room_four.door}."
room_four.message = "You should be on The Voice! But singing won't get you anywhere here."

my_dungeon = Dungeon.new([room_one, room_two, room_three, room_four])
my_dungeon.start_dungeon