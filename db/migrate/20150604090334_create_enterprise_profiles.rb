class CreateEnterpriseProfiles < ActiveRecord::Migration
  def change
    create_table :enterprise_profiles do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name, limit: 20, null: false
      t.string :province, limit: 6, null: false
      t.string :city, limit: 6, null: false
      t.string :district, limit: 6, null: false
      t.string :address, limit: 50, null: false

      t.timestamps null: false
    end
  end
end
