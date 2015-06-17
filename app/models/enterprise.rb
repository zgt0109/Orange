# == Schema Information
#
# Table name: enterprises
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_enterprises_on_email                 (email) UNIQUE
#  index_enterprises_on_reset_password_token  (reset_password_token) UNIQUE
#

class Enterprise < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  with_options dependent: :destroy do |ent|
    ent.has_one :profile,class_name: 'EnterpriseProfile'
    ent.has_many :contacts, class_name: 'EnterpriseContact'
    ent.has_many :positions
    ent.has_many :companies
  end
end
