class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  validates :password, format: { with: /\A([0-9]|[a-zA-Z]|[a-zA-Z0-9]*)\z/i }, allow_blank: true
end
