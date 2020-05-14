require 'rails_helper'

RSpec.describe ListingPayment, type: :model do
  let(:listing) { Listing.new }
  let(:payment) { Payment.new }
  subject { described_class.new(
    payment: payment,
    listing: listing
  )}
  context 'associations' do
    it 'belongs to a Listing' do
      relation = ListingPayment.reflect_on_association(:listing)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'belongs to a Payment' do
      relation = ListingPayment.reflect_on_association(:payment)
      expect(relation.macro).to eql(:belongs_to)
    end
  end
end
