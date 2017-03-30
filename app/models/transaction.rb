class Transaction < ApplicationRecord
  belongs_to :user
  has_many :orders

  enum status: {NO: 0, YES: 1}
end
