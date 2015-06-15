# == Schema Information
#
# Table name: positions
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string(100)
#  state         :string(20)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_positions_on_enterprise_id  (enterprise_id)
#  index_positions_on_name           (name)
#  index_positions_on_state          (state)
#

class Position < ActiveRecord::Base
  include AASM
  belongs_to :enterprise

  aasm column: :state do
    state :pending, :initial => true
    state :confirmed

    event :confirm do
      transitions :from => :pending, :to => :confirmed
    end
  end

end
