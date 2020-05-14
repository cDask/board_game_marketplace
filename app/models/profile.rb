class Profile < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :listings
  validates :username, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 500 }
  validates :rating, numericality: { greater_than_or_equal_to: 100 }
end
