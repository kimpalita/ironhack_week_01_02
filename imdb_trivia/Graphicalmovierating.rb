require 'imdb'
require 'pry'
class Movies
	attr_accessor :movie_hash_response

	def initialize(source_file)
		@source_file = source_file
		@movie_to_searchs = IO.readlines(@source_file).each {|m| m.delete!("\n")}
		@movie_hash_response = {}
	end
	def add_to_hash
		@movie_to_searchs.each { |movie_to_search|
			@movie_hash_response[movie_to_search]= Imdb::Search.new(movie_to_search).movies.first.rating
		}
		@movie_hash_response
	end
end


movies =  Movies.new("movies.txt")
movies.add_to_hash


puts movies.movie_hash_response


=begin
NOTES
previous function call:
	movies = Movies.new("movies.txt").add_to_hash
	puts movies.movie_hash_response  --> returns error message with undefined method 'movie_hash_response'
This does not work, as it is the equivalent of doing:
	movies =  Movies.new("movies.txt")
	movies = movies.add_to_hash
Therefore there is no movie hash attribute belonging to movies declared in the second line.
=end
