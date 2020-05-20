class Transaction < ApplicationRecord
  belongs_to :listing
  belongs_to :profile
  validates :rating, inclusion: {
    in: [nil, 100, 200, 300, 400, 500],
    message: '%<value> is not a valid rating'
  }
end
