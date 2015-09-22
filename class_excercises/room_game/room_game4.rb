class Dungeon
	def initialize(rooms)
		@rooms = rooms
		@player = Player.new
		@game_not_finished = true
		@current_room = 0
	end

	def start_dungeon
		while @game_not_finished
			puts @rooms[@current_room].description
			order = gets.chomp
			if order === "exit"
				@game_not_finished = false
			end
		end

	end
end

class Room
	attr_accessor :exits
	attr_accessor :description

	def initialize(exits)
		@exits = exits
	end
end

class Player
	attr_accessor :inventory
end

room_one = Room.new({"N" => 1, "S" => 0, "E" => 0, "W" => 0})
room_one.description = "This room is so dark."

room_two = Room.new({"N" => 0, "S" => -1, "E" => 1, "W" => 0})
room_two.description = "This room is dimly lit."

room_three = Room.new({"N" => 0, "S" => 1, "E" => 1, "W" => -1})
room_three.description = "This room is bright."

room_four = Room.new({"N" => 1, "S" => 0, "E" => -1, "W" => 0})
room_four.description = "This room is blinding!"

my_dungeon = Dungeon.new([room_one, room_two, room_three, room_four])
my_dungeon.start_dungeon