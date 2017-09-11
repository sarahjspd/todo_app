class TasklistsController < ApplicationController

	def index
		@taskli = Tasklist.all
		@tas = Task.all
	end

	def new
		@taskli = Tasklist.new
	end

	def create

		post_params = params.require(:tasklist).permit(:tasklistname, :duedate)
		@taskli = Tasklist.new(post_params)
		if @taskli.save
			flash[:notice] = 'Successfully Created!'
			# redirect_to tasklist_path(id: @taskli.id) to redirect to show. Commenting because show has an issue with the @tas form.
			redirect_to tasklists_path
		else
			flash.now[:notice] = 'Not successfully created, please check your input.'
			render :new #when you type new, this looks for app/view/posts/new.html.erb
		end

	end

	def show
		@taskli = Tasklist.find_by(id: params[:id])
		@tas = Task.new
		if @tas.save
			flash.now[:notice] = "Successfully Created!"
			redirect_to tasklist_path(id: @taskli.id)
		end
	end

	def edit
		@taskli = Tasklist.find_by(id: params[:id])
	end

	def update
		post_params = params.require(:tasklist).permit(:tasklistname, :duedate)
		@taskli = Tasklist.find(params[:id])
		if @taskli.update(post_params)
			flash[:notice] = 'Successfully Updated!'
			# redirect_to tasklist_path(id: @taskli.id) to redirect to show. Commenting because show has an issue with the @tas form.
			redirect_to tasklists_path
		else
			flash.now[:notice] = 'Not successfully updated, please check your input.'
			render :edit
		end
	end

	def destroy
		@taskli = Tasklist.find(params[:id])
		if @taskli.destroy
			flash[:notice] = 'Tasklist Successfully Deleted'
			redirect_to tasklists_path
		end

	end

end