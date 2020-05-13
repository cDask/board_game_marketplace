class Transaction < ApplicationRecord
  belongs_to :listing
  belongs_to :profile
  validates :rating, inclusion: {
    in: [100, 200, 300, 400, 500],
    message: '%<value> is not a valid rating'
  }
  validates :rating, numericality: { less_than_or_equal_to: 500 }
  validates :rating, numericality: { greater_than_or_equal_to: 100 }
end
