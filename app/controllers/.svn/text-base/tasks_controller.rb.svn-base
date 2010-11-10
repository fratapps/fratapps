class TasksController < ApplicationController

	def new
		#debugger
		@task = Task.new
		@task_instances = []
		
		# Default number of task instances
		@instance_count = 1
		
		@users = current_user.group.users
		for i in 0...@users.length
			@users[i] = @users[i].name
		end
		render 'new'
	end


	def create
	
		# Create the task
		@task = Task.new(params[:task])
		
		# Keep a list of task instances for field repopulation
		@task_instances = []
		# Build the instance objects
		for n in 1..params[:instance_count].to_i do
			@task_instances.push @task.task_instances.build(params['task_instance_' + n.to_s])
			
			# Set user_id and status
			if params['open_task_' + n.to_s]
				# The task is open
				@task_instances.last.status = 'open'
			else
				begin
					# Replace the posted user name with that user's id
					@task_instances.last.user_id = User.find_by_name(params['task_instance_' + n.to_s]["user_id"]).id
					@task_instances.last.status = 'taken'
					@task_instances.last.taken_on = Time.now 
				rescue
					# User couldn't be found
					@invalid = true
					flash.now[:notice] = "Invalid user"
				end
			end
	
			# Handle recurring tasks
			if params['recurring_task_' + n.to_s]
				# The first due date (given above)
				@crawler = Date.civil(params['task_instance_' + n.to_s]['complete_on(1i)'].to_i,
				              		params['task_instance_' + n.to_s]['complete_on(2i)'].to_i, 
				              		params['task_instance_' + n.to_s]['complete_on(3i)'].to_i)
				# The last due date (inclusive)
				@stop_at = Date.civil(params['recur_to_' + n.to_s]['ordermonthdayyear(1i)'].to_i,
				              		params['recur_to_' + n.to_s]['ordermonthdayyear(2i)'].to_i, 
				              		params['recur_to_' + n.to_s]['ordermonthdayyear(3i)'].to_i)
			
				# Step through dates from first to last               
				@crawler.next().step(@stop_at) do |@date|
				
					# If day of week is one of the recurring days
					if ((@date.wday == 0 and params['recur_Su_' + n.to_s]) or 
					(@date.wday == 1 and params['recur_Mo_' + n.to_s]) or 
					(@date.wday == 2 and params['recur_Tu_' + n.to_s]) or 
					(@date.wday == 3 and params['recur_We_' + n.to_s]) or 
					(@date.wday == 4 and params['recur_Th_' + n.to_s]) or 
					(@date.wday == 5 and params['recur_Fr_' + n.to_s]) or 
					(@date.wday == 6 and params['recur_Sa_' + n.to_s]))
		
						# Build an instance
						@ti = @task.task_instances.build(params['task_instance_' + n.to_s])
						
						# Fix due date
						@ti.complete_on = @date
		
						# Set user_id and status
						if params['open_task_' + n.to_s]
							# The task is open
							@ti.status = 'open'
						else
							begin
								# Replace the posted user name with that user's id
								@ti.user_id = User.find_by_name(params['task_instance_' + n.to_s]["user_id"]).id
								@ti.status = 'taken'
								@ti.taken_on = Time.now 
							rescue
							# User couldn't be found
								@invalid = true
								flash.now[:notice] = "Invalid user"
							end 
						end 
					end
				end
			end
		end
	
		# If the instance count was changed, render new's template instead of creating
		# Must happen after task_instances built so repopulation works
		if params[:initial_instance_count] != params[:instance_count]
			@instance_count = params[:instance_count].to_i
			@users = User.find(:all, :order => "name")
			for i in 0...@users.length
				@users[i] = @users[i].name
			end
			flash.now[:notice] = ""
			render 'new'
			return
		end
		
		@task.created_by_id = current_user.id
		@instance_count = params[:instance_count].to_i
		
		# Try to save the task
		if !@invalid and @task.save
			flash[:notice] = 'Task created.'
			redirect_to dashboard_path
		else
			render 'new'
		end
	end
	
	
	
	# PUT /tasks/1
	# PUT /tasks/1.xml
	def update
		@task = Task.find(params[:id])
		
		@task.created_by_id = current_user.id
		
		if @task.update_attributes(params[:task])
			flash[:notice] = 'Task was successfully updated.'
			redirect_to @task
		else
			render 'edit'
		end
	end
	
	
	# DELETE /tasks/1
	# DELETE /tasks/1.xml
	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		
		redirect_to tasks_url
	end
	
	def finished

		# Get the task instance
		task_instance = TaskInstance.find(params[:id])
		
		# Update status to finished
		task_instance.status = 'finished'
		task_instance.complete_on = DateTime.now
		
		# Award the user points
		user_points = task_instance.user.points
		user_points.points += task_instance.task.points
		user_points.save
		#task_instance.user.total_points += task_instance.task.points
		#task_instance.user.save
		
		# Save the task instance and redirect with a message
		if task_instance.save
		  flash[:notice] = 'Task marked finished.'
		  redirect_to dashboard_path
		else
		  flash[:notice] = 'Could not update task.'
		  redirect_to dashboard_path
		end
	end
	
	
	
	def unfinished
		# Get the task instance
		task_instance = TaskInstance.find(params[:id])
		
		# Update status to finished
		task_instance.status = 'unfinished'
		
		# Save the task instance and redirect with a message
		if task_instance.save
		  flash[:notice] = 'Task marked unfinished.'
		  redirect_to dashboard_path
		else
		  flash[:notice] = 'Could not update task.'
		  redirect_to dashboard_path
		end
	end


end
