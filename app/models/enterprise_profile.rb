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
#  shop          :string(20)
#  intro         :text(65535)
#
# Indexes
#
#  index_enterprise_profiles_on_enterprise_id  (enterprise_id)
#

class EnterpriseProfile < ActiveRecord::Base
  belongs_to :enterprise

  validates_presence_of :name, :province, :city, :district, :address
  validates :shop, length: {in: 2..10}, allow_blank: true
end
