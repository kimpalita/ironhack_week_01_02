class Dungeon
	def initialize(rooms)
		@rooms = rooms
		@player = Player.new
	end

	def start_dungeon
		@rooms.each do |room|
			puts "Room number: #{@rooms.index(room)+1}"
			puts "Exit: #{room.door}"
			puts "Room object: #{room.item}"
			puts "Other command: #{room.command}"
			print ">"
			order = gets.chomp

			if order === room.door
				next
			elsif order === room.command
				puts room.message
					if room.effect === 0
						redo
					elsif room.effect === 1
						puts "GAME OVER"
						break
					else next
					end
			elsif order === "pick #{room.item}"
				@player.inventory = room.item
				room.item = nil
				redo
			elsif order === "inventory"
				if @player.inventory === nil
					puts "You have nothing"
				else puts "You have a #{@player.inventory}"
				end
				redo
			elsif order === "drop #{@player.inventory}"
				if @player.inventory === nil
					puts "You have nothing to drop"
				else room.item = @player.inventory
					@player.inventory = nil
				end
				redo
			else puts "Invalid order! Please try again."
				redo
			end
		end
	end
end

class Room
	attr_accessor :door
	attr_accessor :command
	attr_accessor :effect
	attr_accessor :message
	attr_accessor :item

	def initialize(door, command, effect, item)
		@door = door
		@command = command
		@effect = effect
		@item = item
	end
end

class Player
	attr_accessor :inventory
end

room_one = Room.new("North", nil, nil, "knife")

room_two = Room.new("South", "jump", 1, nil)
room_two.message = "You fall and break your leg."

room_three = Room.new("West", nil, nil, nil)

room_four = Room.new("East", "sing", 0, nil)
room_four.message = "You should be on The Voice! But singing won't get you anywhere here."

room_five = Room.new("East", nil, nil, nil)

my_dungeon = Dungeon.new([room_one, room_two, room_three, room_four, room_five])
my_dungeon.start_dungeon