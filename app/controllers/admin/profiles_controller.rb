class Admin::ProfilesController < ApplicationController
  
  before_action :set_profile, :only => [:edit, :update, :destroy]

  def index
    @profile=AdminProfile.all
  end

  def new
  	@profile=AdminProfile.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html{
          redirect_to admin_profile_url(@profile)
        }
        format.js
      else
        format.html {render :edit}
        format.js
      end
    end
  end

  def destroy
    @profile.destroy
    redirect_to admin_profiles_path
  end

  def create
  	@profile=AdminProfile.new(profile_params)
    respond_to do |format|
    	if @profile.save
        format.html{
          redirect_to admin_profiles_path
        }
    	    format.js
    	else
        format.html {render :new}
    	  format.js
    	end
    end
  end

  private

  def set_profile
    @profile=AdminProfile.find(params[:id])
  end

  def profile_params
  	params.require(:admin_profile).permit(:name, :contact, :email, :qq)
  end
end