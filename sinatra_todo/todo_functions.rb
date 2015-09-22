require 'Date'
require 'pry'


class TaskToDo
	attr_accessor :task_details

	def initialize(task_name)
		@task_name = task_name
		@task_date = Time.now
		if @task_name.include? "urgent"
			@task_priority = 2
		else
			@task_priority = 1
		end
		@task_done = false
		@task_details = {}
	end

	def define_task
		@task_details[:task_name] = @task_name
		@task_details[:task_date] = @task_date
		@task_details[:task_done] = @task_done
		@task_details[:task_priority] = @task_priority
		return @task_details
	end
end

#my_first_task = TaskToDo.new("clean room urgent")
#puts my_first_task.define_task

#puts my_first_task.task_details



