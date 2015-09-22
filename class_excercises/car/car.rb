class Car
	def initialize(noise)
		@noise = noise
	end

	def make_noise
		@noise
	end
end


sounds = ["Broom", "Meek", "Nyan"]

cars = sounds.map {|sound| Car.new(sound)}

puts(cars.reduce("") do |sum,car|
	sum + car.make_noise
end)

puts cars
