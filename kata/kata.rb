require 'pry'

class TextFilter
	attr_accessor :output_lines

	def initialize(text_file)
		@text_file = text_file
		@output_lines = []
		@n = 0
		@m = []
	end

	def filter_text
		text = IO.readlines(@text_file)
		@n = text[0].to_i
			if text.size - 1 != @n
				puts "Number of lines do not correspond to N"
				else
				#binding.pry
				text.delete_at(0)
				text.map do |line|
					@m << line[0].to_i
					no_m = line.gsub(line[0], '')
					no_n = no_m.split(' ').sort
					@output_lines << no_n		
				end
				#binding.pry
			end
		
	end

	def reconstruct_lines
		@output_lines.each_with_index.map do |line, index|
			if line.size != @m[index]
				"Line length not equal to M"
			else
			line.join('')
		end

		end
	end
end


my_text = TextFilter.new("kata.txt")
my_text.filter_text
puts my_text.reconstruct_lines
