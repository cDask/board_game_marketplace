class ListingPayment < ApplicationRecord
  belongs_to :listing, dependent: :destroy
  belongs_to :payment, dependent: :destroy
end
