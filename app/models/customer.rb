class Customer < ApplicationRecord
  has_many :tea_subscriptions
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
