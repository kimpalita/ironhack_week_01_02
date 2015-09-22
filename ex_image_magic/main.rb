require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'mini_magick'
require_relative 'functions'

#image = MiniMagick::Image.open("my_image.jpg")
#image.resize "100x100"
#image.format "png"
#image.write "my_output_image.jpg"

file_names = []

#file_names = ['file1', 'file2', 'file3', 'file4']

get '/' do
	@file_names = file_names
	erb :index
end

get '/upload' do
	erb :upload
end

post '/upload' do
	temp_image_file = params[:image_file][:tempfile]
	file_name = params[:image_file][:filename]

	original_image = ImageFiles.new.save_original(file_name, temp_image_file.path)
	thumbnail_image = ImageFiles.new.to_thumbnail(file_name, temp_image_file.path)

	file_names << file_name

	redirect to ('/')
	
end

