require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require_relative 'functions.rb'



get '/time/before/:hours' do
	@now = Time.now
	@before = TimeBefore.new.hours_before(params[:hours])
	erb :hoursbefore
end


get '/todo_item/delete/:item' do
	puts "removing #{params[:item]}"
	redirect to ('/')
end


get '/' do
	erb :demo5
end


post '/movies' do
	@wordcount = WordCount.new.count_words(params[:file])
	erb :words
end

=begin

post '/form' do
	tempfile = params[:file]
	contents = tempfile[:tempfile].read.split(" ")
	"your file is #{contents.length} words long"
end

post '/target_url' do
	"you sent #{params['my_text']} and #{params['other_text']}"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat'] # => ["hello", "world"]
  "say #{params['splat']} "
end

get '/demo' do
  	erb :demo
end

get '/hello/:username' do
  @name = params["username"]
  "Hello #{@name}"
end

get '/demo2' do
	@salute = "Hello World"
	erb :demo2
end

get '/demo3' do
	@time = Time.now
	@date = Date.today
	erb :demo3
	end

get '/demo4'
	titles = Movies.all.map{|m| m.title}
	erb :demo4
end

=end


