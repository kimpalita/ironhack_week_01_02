require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

enable :sessions
 
get '/' do
  erb :index
end
 
get '/authorize' do
  if session[:requesting_site]
    session.clear 
  else
    session[:requesting_site] = "http://brettu.com"
  end 
  erb :index
end
 
get '/reset' do
  session.clear
  erb :index
end