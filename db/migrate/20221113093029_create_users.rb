class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.string :user_name, null: true
      t.string :email, null: true
      t.string :refresh_token, null: false


      t.timestamps
    end
    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
    add_index :users, :refresh_token, unique: true
  end
end
