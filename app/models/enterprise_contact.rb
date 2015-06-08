# == Schema Information
#
# Table name: enterprise_contacts
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string(10)
#  body          :string(20)
#  channel       :string(10)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_enterprise_contacts_on_enterprise_id  (enterprise_id)
#

class EnterpriseContact < ActiveRecord::Base
  extend Enumerize
  enumerize :channel, in: [:qq, :mobile, :email]
  belongs_to :enterprise
end
