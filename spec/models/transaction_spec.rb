require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:profile) { Profile.new }
  let(:listing) { Listing.new }
  subject { described_class.new(
    listing: listing,
    profile: profile,
    rating: 450,
    review: 'Friendly'
  )}
  context 'associations' do
    it 'belongs to a Listing' do
      relation = Transaction.reflect_on_association(:listing)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'belongs to a Profile' do
      relation = Transaction.reflect_on_association(:profile)
      expect(relation.macro).to eql(:belongs_to)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid with rating below 100' do
      subject.rating = 50
      expect(subject).to_not be_valid
    end

    it 'is not valid with a rating above 500' do
      subject.rating = 501
      expect(subject).to_not be_valid
    end

    it 'is not valid with any number for rating apart from 100, 200, 300, 400 and 500' do
      subject.rating = 350
      expect(subject).to_not be_valid
    end
  end
end
