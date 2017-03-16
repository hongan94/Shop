class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :name
      t.text :description
      t.integer :price
      t.integer :qty
      t.integer :category_id
      t.timestamps
    end
    add_index :products, :category_id
  end
end
