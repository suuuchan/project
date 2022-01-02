class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, foreign_key: true
      t.string :title, limit: 10, null: false
      t.string :text, limit: 50, null: false
      t.timestamps
    end
  end
end
