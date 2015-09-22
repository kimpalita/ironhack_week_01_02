class Car
	attr_accessor :sound

	def initialize(sound)
		@sound = sound
	end
end


class CarSoundsReport
	attr_accessor :car_list

	def initialize(car_list, format)
		@car_list = car_list
		@format = format
	end

	def report
		sounds = @car_list.map { |car| car.sound }
		@format.print_format(sounds)
	end
end

class HTMLFormat
	def print_format(list)
		puts "<html>"
		puts " <body>"
		puts "  <ul>"

		list.each do |list_item|
			puts "   <li>#{list_item}</li>"
		end

		puts "  <ul>"
		puts " <body>"
		puts "<html>"
		puts "********************"
	end
end


class MarkdownFormat
	def print_format(list)
		list.each do |list_item|
			puts "- #{list_item}"
		end
		puts "********************"
	end
end


car1 = Car.new("Broom")
car2 = Car.new("Meeek")
car3 = Car.new("Nyan")

cars = [car1, car2, car3]

CarSoundsReport.new(cars, HTMLFormat.new).report

CarSoundsReport.new(cars, MarkdownFormat.new).report

