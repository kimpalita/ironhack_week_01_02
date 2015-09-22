require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require_relative 'todo_functions.rb'

all_tasks = []


get '/' do
	@all_tasks = all_tasks
	erb :index
end


post '/add_todo' do
	new_task = TaskToDo.new(params[:task])
	all_tasks << new_task.define_task
	#binding.pry
	redirect to ('/')
end

get '/done/:value' do
	task_index = params["value"].to_i
	all_tasks[task_index][:task_done] = true
	redirect to ('/')
end

get '/delete/:value' do
	task_number = params["value"].to_i
	all_tasks.delete_at task_number
	redirect to ('/')
end

post '/sort_by/:value' do
	if params["value"] == "priority"
		#sort by priority
		all_tasks.sort! {|a, b| b[:task_priority] <=> a[:task_priority]}
	elsif params["value"] == "date"
		#sort by date
		all_tasks.sort! {|a, b| b[:task_date] <=> a[:task_date]}
	end
	redirect to ('/')
end

get '/save_tasks' do
	IO.write('tasks.txt', all_tasks)
	redirect to ('/')
end

get '/load_saved_tasks' do
	file_contents = IO.read('tasks.txt')
	all_tasks = file_contents
	redirect to ('/')
end







