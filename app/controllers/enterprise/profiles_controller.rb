class Enterprise::ProfilesController < ApplicationController
  def new
    current_enterprise.profile || current_enterprise.build_profile
    current_enterprise.contacts.build
  end


  def update

    if current_enterprise.update(enterprise_profile_params)

    else
      render :new
    end
  end

  def show
    @profile = current_enterprise.profile
  end

  private

    def enterprise_profile_params
      params.require(:enterprise).permit(
        profile_attributes: [:name, :province, :city, :district, :address, :shop, :intro],
        contacts_attributes: [:name, :body, :channel]
      )
    end
end
