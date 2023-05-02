class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
