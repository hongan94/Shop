class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :transaction, foreign_key: true
      t.integer :qty
      t.integer :amount
      t.string :data
      t.integer :status , limit: 1 , default: 0
      t.timestamps
    end
  end
end
