class ListingPayment < ApplicationRecord
  belongs_to :listing
  belongs_to :payment
end
