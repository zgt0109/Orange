class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name, limit: 100
      t.string :state, limit: 20

      t.timestamps null: false
    end
    add_index :positions, :name
    add_index :positions, :state
  end
end
