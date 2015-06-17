class Enterprise::ProfilesController < ApplicationController
  def new
    if current_enterprise.profile
      @profile = current_enterprise.profile
    else
      @profile = EnterpriseProfile.new
    end
  end


  def create
    @profile = current_enterprise.build_profile(profile_params)
    if @profile.save
      redirect_to enterprise_contacts_path
    else
      render :new
    end
  end

  def show
    @profile = current_enterprise.profile
  end

  private

    def profile_params
      params.require(:enterprise_profile).permit(
        :name, :province, :city, :district, :address, :shop, :intro
      )
    end
end
