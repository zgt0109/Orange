class CreateEnterpriseContacts < ActiveRecord::Migration
  def change
    create_table :enterprise_contacts do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name, limit: 10
      t.string :body, limit: 20
      t.string :channel, limit: 10

      t.timestamps null: false
    end
  end
end
