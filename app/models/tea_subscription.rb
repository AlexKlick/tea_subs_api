class TeaSubscription < ApplicationRecord
  belongs_to :customer
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :frequency, presence: true
end
