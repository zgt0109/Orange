class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name, limit: 100
      t.string :state, limit: 20

      t.timestamps null: false
    end
    add_index :companies, :name
    add_index :companies, :state
  end
end
