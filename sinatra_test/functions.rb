require 'pry'
class WordCount
	def count_words(file)
		tempfile = file
		@wordcount = tempfile[:tempfile].read.split.size
		return @wordcount
	end
end

class TimeBefore
	def hours_before(hours)
		time_to_subtract = hours.to_i * 3600
		@now = Time.now
		@before = @now - time_to_subtract
		return @before
	end
end