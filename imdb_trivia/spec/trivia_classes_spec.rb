require_relative '../trivia_classes.rb'


RSpec.describe "" do

	let(:invalid_movie) do
		instance_double("Movies", title: "Ghost", poster: nil, year: 1988, cast_members: ["Jackie Chan"])
	end

	let(:valid_movie_one) do
		instance_double("Movies", title: "Time Machine", poster: "poster_one", year: 1996, cast_members: ["Brad Pitt"])
	end

	let(:valid_movie_two) do
		instance_double("Movies", title: "Dance", poster: "poster_two", year: 1992, cast_members: ["Brad Pitt"])
	end

	let(:valid_movie_three) do
		instance_double("Movies", title: "Sharks", poster: "poster_two", year: 1996, cast_members: ["Jane Doe"])
	end

	let(:my_mock_movies){MovieData.new([invalid_movie, valid_movie_one, valid_movie_two, valid_movie_three])}

#FIRST ITERATION
	#with the second iteration, this test is expected to fail
	it "return posters of movies -- movie with nil poster not included" do
	my_mock_movies.get_data
	expect(my_mock_movies.movie_data_array.map {|movie| movie[:title]}).to eq(["Time Machine", "Dance", "Sharks"])
	end

#SECOND ITERATION
	it "check that movies with no posters are included and no movies with the same year repeated" do
	my_mock_movies.get_data
	expect(my_mock_movies.movie_data_array.map {|movie| movie[:title]}).to eq(["Time Machine", "Dance"])
	end

#THIRD ITERATION
	it "checks that movies do not have the same member of cast" do
	my_mock_movies.get_data
	expect(my_mock_movies.movie_data_array.map {|movie| movie[:title]}).to eq(["Time Machine"])
	end

#=======================


end