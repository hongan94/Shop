class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.integer :user_phone
      t.string :user_email
      t.string :user_name
      t.integer :user_id
      t.integer :amount
      t.integer :status, limit: 1, default: 0
      t.string :payment
      t.string :payment_info
      t.string :message
      t.string :security
      t.timestamps
    end
  end
end
