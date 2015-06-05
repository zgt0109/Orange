class Enterprise::ProfilesController < ApplicationController
  def new
    @profile = current_enterprise.build_profile
  end


  def create
    @profile = current_enterprise.build_profile(enterprise_profile_params)
    if @profile.save

    else
      render :new
    end
  end

  def show
    @profile = current_enterprise.profile
  end

  private

    def enterprise_profile_params
      params.require(:enterprise_profile).permit(:name, :province,
                    :city, :district, :address, :shop, :intro)
    end
end
