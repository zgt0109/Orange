module Enterprise::ProfileHelper

  def render_enterprise_profile_address(profile)
    address = ChinaCity.get(profile.province)
    address += ChinaCity.get(profile.city)
    address += ChinaCity.get(profile.district)
    address += profile.address
  end

  def render_enterprise_profile_name(profile)
    profile.name
    profile.name + "(#{profile.shop})" if profile.shop
  end
end
