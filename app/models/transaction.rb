class Transaction < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :user_phone,:presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  validates :user_name, :user_email, :user_address, :payment, presence: true
  enum status: {"Chưa thanh toán": 0, "Đã thanh toán": 1}
  enum payment: {"Đặt hàng": 1, "Thanh toán online": 0}

  scope :get_transaction, -> {where('amount >= ?', 1000000) }
end
