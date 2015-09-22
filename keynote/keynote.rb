require 'terminfo'

class Presentation
	attr_accessor :slide_content

	def initialize(text_file)
		@text_file = text_file
		@slides = IO.readlines(@text_file) #This is an array of each line
		@myslides = SlideDisplay.new(@slides)#.display_current_slide
	end

	def navigation
		print ">"
		nav = gets.chomp
		while nav === "next" || nav === "prev"
			case nav
			when "next"
				@myslides.display_current_slide(1)
			when "prev"
				@myslides.display_current_slide(-1)
			else @myslides.display_current_slide(0)
			end
			nav = gets.chomp
		end
	end

end

class SlideDisplay
	def initialize(contents)
		@current_slide = 0
		@contents = contents
		@height_of_screen = TermInfo.screen_height
		@width_of_screen = TermInfo.screen_width
	end

	def self.current_slide
		@current_slide
	end

	def display_current_slide(nav)
		puts @contents[@current_slide += nav]
	end
end




apple_keynote = Presentation.new("keynote.txt").navigation















