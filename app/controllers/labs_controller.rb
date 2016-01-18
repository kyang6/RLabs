class LabsController < ApplicationController
	before_action :find_lab, only: [:show, :edit, :update, :destroy] 
	before_action :authenticate_user!, except: [:show, :index]
	
	
	
	def index
		@lab = Lab.all
	end

	def show
	end

	def new
		@lab = current_user.labs.build
	end

	def create
		@user = current_user
		@lab = @user.labs.build(lab_params)
		

		if @lab.save 
			redirect_to @lab, notice: "Successfully Created new Lab"
		else
			render 'new'
		end

	end

	def edit
		if can? :update, @lab
		else
			redirect_to root_path, notice: "You do not have permission to Update this Lab"
		end

		
	end

	def update
		
		if @lab.update(lab_params)
			redirect_to @lab
		else
			render 'edit'
		end
	
	end

	def destroy
		if can? :destroy, @lab
			@lab.destroy
			redirect_to root_path, notice: "Successfully Deleted Lab"
		else
			redirect_to root_path, notice: "You do not have permission to Update this Lab"
		end

	end

	


	private



	def lab_params
		params.require(:lab).permit(:title, :description, :director, :req, :suggested, :year, :image, :location, :webpage, :email, :lab_capacity, :current_count, :time_commitment,
			publications_attributes: [:id, :citation, :year, :link, :_destroy], projects_attributes: [:id, :title, :description, :_destroy])
	end


	def find_lab
		@lab = Lab.find(params[:id])
	end

	

end
