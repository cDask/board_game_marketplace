class ListingPayment < ApplicationRecord
  belongs_to :listing, dependent: :delete
  belongs_to :payment, dependent: :delete
end
