class Vehicle
	attr_accessor :sound, :no_of_wheels

	def initialize(sound, no_of_wheels)
		@sound = sound
		@no_of_wheels = no_of_wheels
	end

end


class Wheels
	def self.total_wheels(vehicles)
		puts ("TOTAL NUMBER OF WHEELS: #{vehicles.reduce(0) {|sum, vehicle| sum + vehicle.no_of_wheels}}")
	end
end


class Sounds
	def self.show_sounds(vehicles)
		vehicles.each do |vehicle|
			puts vehicle.sound
		end
	end
end

truck = Vehicle.new("brrooom", 6)
car = Vehicle.new("broom", 4)
bicycle = Vehicle.new("tititititit", 2)
airplane = Vehicle.new("RRRAAAAARRR", 6)

Sounds.show_sounds([truck,car, bicycle, airplane])
Wheels.total_wheels([truck,car, bicycle, airplane])

