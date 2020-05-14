class Payment < ApplicationRecord
  validates :name, presence: true
end
