class DashboardController < ApplicationController

	before_filter :authenticate
	
	def index
		# Set the locals to be displayed in the tables
		# All open tasks
		@open_task_instances = TaskInstance.find(:all, :conditions => "status = 'open'")
		# Tasks belonging to the logged in user
		@user_task_instances = current_user.task_instances
		# The top ten users for the leaderboard
		@leaderboard_users = current_user.group.users.all(:limit => 10)
		@leaderboard_users.sort!{|a,b| b.points.points <=> a.points.points}
		#@leaderboard_users = User.find(:all,
		#  :order => "total_points desc, name",
		#  :limit => 10)
		# Pending tasks for admins
		@pending_task_instances = TaskInstance.find(:all, :conditions => "status = 'pending'") if current_user.admin? or current_user.super_admin?
		# Overdue tasks for admins
		@overdue_task_instances = [] if current_user.admin? or current_user.super_admin?
  
		if current_user.admin?
			render 'admin'
		else
			render 'user'
		end
	end
	
	
	def leaderboard
		# Set the local for the table
		# All users sorted by points then name
		#@leaderboard_users = User.find :all, :order => "total_points desc, name"
		@leaderboard_users = current_user.group.users.all(:limit => 10)
		@leaderboard_users.sort!{|a,b| b.points.points <=> a.points.points}
	end
	
	def take
		# Find the task to take
		task_instance = TaskInstance.find(params[:id])
		
		# Redirect with a message if the task isn't open anymore
		unless task_instance.status == 'open'
		  flash[:notice] = 'Unable to take that task (someone may have beat you to it).'
		  redirect_to :action => 'index'
		  return
		end
		
		# Take the task, updating the necessary attributes
		task_instance.user_id = current_user.id
		task_instance.status = 'taken'
		task_instance.taken_on = Time.now
		
		# Save the task and redirect with a message
		if task_instance.save
		  flash[:notice] = 'Task taken successfully.'
		  redirect_to :action => 'index'
		else
		  flash[:notice] = 'Unable to take that task.'
		  redirect_to :action => 'index'
		end
	end
	
	begin
	def abandon
		# Find the task to abandon
		task_instance = TaskInstance.find(params[:id])
		
		# Redirect with a message if the active user doesn't own that task
		unless task_instance.user_id == current_user.id
		  flash[:notice] = "Unable to abandon that task."
		  redirect_to :action => 'index'
		  return
		end
		
		# Abandon the task, updating the necessary attributes
		task_instance.user_id = nil
		task_instance.status = 'open'
		task_instance.taken_on = nil
		
		# Save the task and redirect with a message
		if task_instance.save
		  flash[:notice] = 'Task abandoned.'
		  redirect_to :action => 'index'
		else
		  flash[:notice] = 'Unable to abandon that task.'
		  redirect_to :action => 'index'
		end
	end
	end
	
	def submit_for_approval
		# Find the task to submit
		task_instance = TaskInstance.find(params[:id])
		
		# Check that the user owns the task
		unless task_instance.user_id == current_user.id
		  flash[:notice] = 'Unable to update task.'
		  redirect_to :action => 'index'
		end
		
		# Change the status to pending
		task_instance.status = 'pending'
		
		# Save the task and redirect with a message
		if task_instance.save
		  flash[:notice] = 'Task submitted for approval.'
		  redirect_to :action => 'index'
		else
		  flash[:notice] = 'Unable to update task.'
		  redirect_to :action => 'index'
		end
	end
	
end
