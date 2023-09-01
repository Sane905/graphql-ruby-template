class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.string :user_uid, null: false
      t.string :title, null: false
      t.string :message, null: false
      t.timestamps
    end

    add_foreign_key :posts, :users, primary_key: :uid, column: :user_uid, on_update: :cascade, on_delete: :cascade
  end
end
