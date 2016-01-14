class LabsController < ApplicationController
	before_action :find_lab, only: [:show, :edit, :update, :destroy] 

	def index
		@lab = Lab.all
	end

	def show
	end

	def new
		@lab = Lab.new
	end

	def create
		@lab = Lab.new(lab_params)

		if @lab.save 
			redirect_to @lab, notice: "Successfully Created new Lab"
		else
			render 'new'
		end

	end

	def edit
	end

	def update
		if @lab.update(lab_params)
			redirect_to @lab
		else
			render 'edit'
		end
	end

	def destroy
		@lab.destroy
		redirect_to root_path, notice: "Successfully Deleted Lab"
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
