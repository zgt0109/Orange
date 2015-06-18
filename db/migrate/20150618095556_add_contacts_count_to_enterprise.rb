class AddContactsCountToEnterprise < ActiveRecord::Migration
  def change
    add_column :enterprises, :contacts_count, :integer, default: 0
  end
end
