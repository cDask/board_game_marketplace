class Payment < ApplicationRecord
  has_many :listing_payments
  has_many :listings, through: :listing_payments
  validates :name, presence: true
end
