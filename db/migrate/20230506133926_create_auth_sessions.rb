class CreateAuthSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :auth_sessions, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.string :user_uid, null: false
      t.string :token, null: false
      t.datetime :last_accessed_at, null: false
      t.timestamps
    end

    add_foreign_key :auth_sessions, :users, primary_key: :uid, column: :user_uid, on_update: :cascade, on_delete: :cascade
    add_index :auth_sessions, :token, unique: true
  end
end
