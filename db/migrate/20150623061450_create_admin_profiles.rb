class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|
      t.string :name, limit: 20
      t.string :contact, limit: 50
      t.string :email, limit: 50
      t.string :qq

      t.timestamps null: false
    end
  end
end
