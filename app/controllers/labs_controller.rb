class LabsController < ApplicationController
	include SmartListing::Helper::ControllerExtensions
	helper  SmartListing::Helper
	before_action :find_lab, only: [:show, :edit, :update, :destroy] 
	before_action :authenticate_user!, except: [:show, :index]
	
	
	
	def index
		labs_scope = Lab.all
		# searches with search function found in the lab model
		labs_scope = labs_scope.search(params[:filter]) if params[:filter]
		# filters labs based on lab capacity
		labs_scope = labs_scope.where("lab_capacity != '0'") if params[:with_lab_capacity] == "1"
		# calls the private filter_category method to filter based on categories
		labs_scope = filter_category(labs_scope)
	
		smart_listing_create :labs, labs_scope, partial: "labs/list"
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
	

	def filter_category(labs_scope)
			# When each parameter is clicked, then the variable will be changed
			# to the parameter name and will be added to the scope

			bio = ""
			chem = ""
			biochem = ""
			phy = ""
			psy = ""
			sus = ""
			ese = ""

			
			if params[:with_biology] == "1"
				bio = "Biology"
			end
			if params[:with_chemistry] == "1"
				chem = "Chemistry" 
			end
			if params[:with_biochemistry] == "1"
				biochem = "Biochemistry"
			end
			if params[:with_physics] == "1"
				phy = "Physics"
			end
			if params[:with_psychology] == "1"
				psy = "Psychology"
			end
			if params[:with_sustainability] == "1"
				sus = "Sustainability"
			end  
			if params[:with_earth_and_space] == "1"
				ese = "Earth and Space exploration"
			end 
			labs_scope.where("category=? OR category=? OR category=? OR 
				category=? OR category=? OR category=? OR category=?",bio,chem,biochem,phy,
				psy, sus, ese)	
	end

	private

	def lab_params
		params.require(:lab).permit(:title, :description, :director, :req, :suggested, :year, :image, :location, :webpage, :email, :lab_capacity, :current_count, :category,
		 :time_commitment, publications_attributes: [:id, :citation, :year, :link, :_destroy], projects_attributes: [:id, :title, :description, :_destroy])
	end


	def find_lab
		@lab = Lab.find(params[:id])
	end

	

end
