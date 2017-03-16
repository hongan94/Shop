class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :bigcategory_id
      t.string :image
      t.timestamps
    end
    add_index :categories, :bigcategory_id
  end
end
