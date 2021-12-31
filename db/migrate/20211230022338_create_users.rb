class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   "name", limit: 10, null: false
      t.string   "mail", null: false
      t.string   "password_digest", limit: 200, null: false
      t.string   "remember_token", limit: 200
      t.timestamps
    end
  end
end
