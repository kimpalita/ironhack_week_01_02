require 'imdb'
require 'pry'

module Enumerable
  def does_not_include?(item)
    !include?(item)
  end
end

class MovieSearch
	attr_accessor :movie_search, :movie_data_array

	def initialize(search_word)
		@search_word = search_word
		@movie_search = Imdb::Search.new(@search_word).movies #this returns an array
	end
end

class MovieData
	include Enumerable

	attr_accessor :movie_data_array

	def initialize(movie_list)
		@movie_list = movie_list
		@movie_data_array = []
		@years = []
		@casts_array = []
	end

	def get_data
		i = 0
		while @movie_data_array.size < 9 && i < @movie_list.size do
			if @movie_list[i].poster != nil && @years.does_not_include?(@movie_list[i].year) && @casts_array.does_not_include?(@movie_list[i].cast_members[0])
					movie_hash = {}
					movie_hash[:title] = @movie_list[i].title
					movie_hash[:poster] = @movie_list[i].poster
					movie_hash[:year] = @movie_list[i].year
					movie_hash[:cast] = @movie_list[i].cast_members[0]
					@years << @movie_list[i].year
					@casts_array << @movie_list[i].cast_members[0]
					@movie_data_array << movie_hash
				#binding.pry
			end
			i += 1
		end
	end
end


movie = MovieData.new(MovieSearch.new("funny").movie_search)
movie.get_data
p movie.movie_data_array