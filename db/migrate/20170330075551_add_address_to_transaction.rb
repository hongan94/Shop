class AddAddressToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :user_address, :string
  end
end
