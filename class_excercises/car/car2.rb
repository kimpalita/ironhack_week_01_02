class Car
	def initialize(engine)
		@engine = engine
		@car_sound = "huuuuuummmmm...."
	end

	def make_noise
		puts @car_sound
		@engine.noise
	end
end

class LoudEngine
	def noise
		puts "BRRROOOOOOOOOM"
	end
end

class SoftEngine
	def noise
		puts "brrrrrrmmm...."
	end
end

class BrokenEngine
	def noise
		puts "PAH PAH PAH PAH PAH"
	end
	end

car = Car.new(LoudEngine.new)
other_car = Car.new(SoftEngine.new)
another_car = Car.new(BrokenEngine.new)


car.make_noise
other_car.make_noise
another_car.make_noise