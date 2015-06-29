# == Schema Information
#
# Table name: admin_profiles
#
#  id         :integer          not null, primary key
#  name       :string(20)
#  contact    :string(50)
#  email      :string(50)
#  qq         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdminProfile < ActiveRecord::Base
	belongs_to :admin
	validates :name, :contact, :email, :qq, presence:true
    validates :name,uniqueness:{message:'已经存在!',case_sensitive: false}
end
