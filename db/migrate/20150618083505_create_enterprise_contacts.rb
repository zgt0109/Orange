class CreateEnterpriseContacts < ActiveRecord::Migration
  def change
    create_table :enterprise_contacts do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name, limit: 20
      t.boolean :gender, default: true

      t.timestamps null: false
    end
  end
end
