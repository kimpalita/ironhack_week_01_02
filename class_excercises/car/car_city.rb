class Car
    def initialize
        @cities_visited = []
    end
    
    def add_city(city)
        @cities_visited.push(city)
    end
    
    def cities_to_file
        IO.write("cities.txt", @cities_visited)
    end
end

class RacingCar < Car
	attr_accessor :sound

	def initialize
		@sound = "BROOOM"
	end
end


my_car = Car.new
my_car.add_city("paris")
my_car.add_city("berlin")
my_car.add_city("rome")

puts RacingCar.new.sound
