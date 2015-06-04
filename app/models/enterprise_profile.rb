# == Schema Information
#
# Table name: enterprise_profiles
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string(20)       not null
#  province      :string(6)        not null
#  city          :string(6)        not null
#  district      :string(6)        not null
#  address       :string(50)       not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_enterprise_profiles_on_enterprise_id  (enterprise_id)
#

class EnterpriseProfile < ActiveRecord::Base
  belongs_to :enterprise

  validates_presence_of :name, :province, :city, :district, :address
end
