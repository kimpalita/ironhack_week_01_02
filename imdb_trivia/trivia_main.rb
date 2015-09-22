require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'open-uri'
require_relative 'trivia_classes.rb'

get '/' do
	erb :index
end

post '/load_movies' do
	@word = params[:search_query]
	if @word.length === 0
		redirect to ("/")
	else
		redirect to ("/movie_trivia/#{@word}")
	end
end

post '/load_movies_from_dictionary' do
	words_file = open("http://www.math.sjsu.edu/~foster/dictionary.txt")
	@word = words_file.readlines.shuffle.sample

	redirect to ("/movie_trivia/#{@word}")
	end

get '/movie_trivia/:search_query' do
	@word = params[:search_query]

	my_movies = MovieData.new(MovieSearch.new(@word).movie_search)
	my_movies.get_data
	@my_movies_array = my_movies.movie_data_array
	@random_movie = @my_movies_array.shuffle.sample
	erb :movie_trivia
end