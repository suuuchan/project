class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :user_id, foreign_key: true
      t.integer :score, null: false
      t.timestamps
    end
  end
end
