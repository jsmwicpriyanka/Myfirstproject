class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :edit, :update]
	before_action :edit_profile, only: [:edit, :update]
  before_action :new_profile, only: [:new, :create]
	def index
		@profile = Profile.all
	end

	def show
  end

  def new
  	@profile = Profile.new
  end

  def create
		@profile = current_user.build_profile(profile_params)
 	  if @profile.save
	  	redirect_to @profile
		else
			render 'new'
		end
	end

  def edit
	end

	def update
			if @profile.update(profile_params)
				redirect_to @profile
			else 
				render 'edit'
			end
	end

private

	def new_profile
		if current_user.profile.present?
			redirect_to root_path
		end
	end

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def edit_profile		
		redirect_to root_path if current_user.profile.id != @profile.id		
	end

  def profile_params
    params.require(:profile).permit(:work, :birth_date, :gender, :religious_view, :about_you, :name_type, :name, :fav_quotes, :relationship_status, :picture )
  end
  
end
