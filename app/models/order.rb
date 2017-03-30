class Order < ApplicationRecord
  belongs_to :product
  belongs_to :transactions

  enum status: {"Chưa Giao": 0, "Đã giao hàng": 1}

end
