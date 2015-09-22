require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
#require_relative 'functions.rb'

enable :sessions



get '/' do
	@token = session[:token]
	@current_session = session[:username]
	erb :login
end

get '/login' do
	
	users = [['user1', 'pass1'], ['user2', 'pass2'], ['user3', 'pass3']]

	username = params['username']
	password = params['password']
	session[:token] = false
	users.each do |user|
		if user[0] == username && user[1] == password
			session[:token] = true
			session[:username] = username
			redirect to('/secret_documents')
		end
	end

	status 401
	erb :login_failed
end


get '/secret_documents' do
	if session[:token] == false
		status 401
		erb :login_failed
	end
	"Shhhhh..... Let me tell you a secret"
end


get '/logout' do
	session[:token] = false
	redirect to ('/')
end

get '/failed_login' do
	status 401
	erb :login_failed
end