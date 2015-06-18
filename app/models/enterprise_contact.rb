# == Schema Information
#
# Table name: enterprise_contacts
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string(20)
#  gender        :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_enterprise_contacts_on_enterprise_id  (enterprise_id)
#

class EnterpriseContact < ActiveRecord::Base
  belongs_to :enterprise, counter_cache: :contacts_count
  validates_presence_of :name
  default_scope ->{ order 'created_at DESC'}
end
