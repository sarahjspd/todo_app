class TasksController < ApplicationController
# before_action :set_task_list, only: [:new, :create, :index]
	def index
		@tas = Task.all
	end

	def new
		@taskli = Tasklist.find(params[:tasklist_id])
		@tas = Task.new
	end


	def create
# POST/tasklists/:tasklist_id/tasks
		@taskli = Tasklist.find(params[:tasklist_id])
		task_params = params.require(:task).permit(:taskname, :description, :duedate, :priority, :status) 
		@tas = @taskli.tasks.build(task_params)
# You can uses tasks becos you defined it in the model. When you use tasks.build it stores the tasklist_id from @taskli.
		if @tas.save
			flash[:notice] = 'Successfully Created!!'
			redirect_to tasklist_path(id: @taskli.id)
		else
			flash.now[:notice] = 'Not Successfully Created, Try Again'
			render :new
		end
	end

	def show
		@taskli = Tasklist.find(params[:tasklist_id])
		@tas = Task.find_by(id: params[:id])

	end


	def edit
		@taskli = Tasklist.find(params[:tasklist_id])
		@tas = Task.find_by(id: params[:id])
	end

	def destroy
		@taskli = Tasklist.find(params[:tasklist_id])
		@tas = Task.find_by(id: params[:id])
		if @tas.destroy
			flash[:notice] = 'Task Successfully Deleted'
			redirect_to tasklist_path(id: @taskli.id)
		end	
	end

	def update
		@taskli = Tasklist.find(params[:tasklist_id])
		task_params = params.require(:task).permit(:taskname, :description, :duedate, :priority, :status) 
		if @taskli.update(task_params)
			flash[:notice] = 'Successfully Updated!'
			# redirect_to tasklist_path(id: @taskli.id) to redirect to show. Commenting because show has an issue with the @tas form.
			redirect_to tasklists_task_path(tasklist_id: @taskli.id)
		else
			flash.now[:notice] = 'Not successfully updated, please check your input.'
			render :edit
		end
	end
	
end






