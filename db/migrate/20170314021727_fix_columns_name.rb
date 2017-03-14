class FixColumnsName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :provider, :name
  end
end
