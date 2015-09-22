require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require_relative 'functions.rb'


get '/' do
	#IO.write('number.txt', 0)
	#@saved_number = IO.read('number.txt').to_i
	IO.write('number.txt', 0)
	@current_saved_number = IO.read('number.txt').to_i
	erb :calculator1
end



post '/calculate' do
	@saved_number = IO.read('number.txt').to_i
	@new_number = params['new_number'].to_i
	#IO.write('number.txt', @new_number)
	@operation = params['calculate_button']
	@total = MathOperation.new(@saved_number, @new_number).send(@operation)
	IO.write('number.txt', @total)
	erb :calculator2
end


get '/clear' do
	redirect to ('/')
end


=begin
get '/' do
	erb :calculator
end

post '/calculate' do
	#binding.pry
	@first_number = params['first_number'].to_i
	@second_number = params['second_number'].to_i
	@operation = params['calculate_button']
	@total = MathOperation.new(@first_number, @second_number).send(@operation)
	erb :calculator
end

get '/clear' do
	redirect to ('/')
end


get '/ascii/:word' do
	a = Artii::Base.new :font => 'slant'
	@word_art = '<pre>'+a.asciify(params[:word])+'</pre>'
	erb :wordascii
end
=end

