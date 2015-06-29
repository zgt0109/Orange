class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, limit: 20
      t.string :content, limit: 255

      t.timestamps null: false
    end
  end
end
