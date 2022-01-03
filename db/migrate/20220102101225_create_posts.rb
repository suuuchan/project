class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, foreign_key: true
      t.string :title, null: false
      t.string :text, null: false
      t.timestamps
    end
  end
end
