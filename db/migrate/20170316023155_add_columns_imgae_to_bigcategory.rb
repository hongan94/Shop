class AddColumnsImgaeToBigcategory < ActiveRecord::Migration[5.0]
  def change
    add_column :bigcategories, :image, :string
  end
end
