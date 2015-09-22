require 'imdb'
require 'open-uri'

movie_search = Imdb::Search.new("Funny").movies.take(5) #this returns an array
puts movie_search[4].poster
puts movie_search[4].cast_members.first


class TextFromWeb

	def some_method
		file = open("http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt")
		file.readlines.shuffle.sample
	end
end

a = TextFromWeb.new
puts a.some_method
=begin
posters = []
movie_search.each do |movie|
	posters << movie.poster
end

puts posters


#i = Imdb::Movie.new("0095016")
#puts i.title
#=> "Die Hard"
#puts i.cast_members.first


class MoviePosters
	attr_accessor :posters

	def initialize(search_word)
		@search_word = search_word
		@posters = []
		@movies = Imdb::Search.new(@search_word).movies
	end

	def get_posters
		i = 0
		while @posters.size < 4 && i < @movies.size do
			if @movies[i].poster != nil
				@posters << @movies[i].poster
				i += 1
			end
		end
	end
end

#movie_search = Imdb::Search.new("Funny").movies.take(12) #this returns an array
#first_nine_results = a.movies.take(9)
#posters = []
#i = 0


test_search = MoviePosters.new("Ghostbusters")
test_search.get_posters

puts test_search.posters


http://ia.media-imdb.com/images/M/MV5BMTQyOTA5NTkyMF5BMl5BanBnXkFtZTgwNzE3NDI0MjE@.jpg
http://ia.media-imdb.com/images/M/MV5BMTMyODEyMzc0Nl5BMl5BanBnXkFtZTcwNjQ4MzA1MQ@@.jpg
http://ia.media-imdb.com/images/M/MV5BMTg4OTExNTYzMV5BMl5BanBnXkFtZTcwOTg1MDU1MQ@@.jpg
http://ia.media-imdb.com/images/M/MV5BMTcwMTMyMDA3N15BMl5BanBnXkFtZTcwODUzMjk3OA@@.jpg
http://ia.media-imdb.com/images/M/MV5BMTMxNDQ5MTA5MF5BMl5BanBnXkFtZTcwMzUyMDUwMg@@.jpg
http://ia.media-imdb.com/images/M/MV5BMTgwMjc3Mjc0NF5BMl5BanBnXkFtZTgwODYxMDM0NDE@.jpg
http://ia.media-imdb.com/images/M/MV5BMTUwNTEwMzYyNV5BMl5BanBnXkFtZTcwNjY1MjMyMQ@@.jpg
http://ia.media-imdb.com/images/M/MV5BMjAwNDIxMjk2M15BMl5BanBnXkFtZTcwOTUyNzgxMQ@@.jpg
http://ia.media-imdb.com/images/M/MV5BODkxMDg0MjM2OF5BMl5BanBnXkFtZTcwMjc0NTU4MQ@@.jpg
=end
