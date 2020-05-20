require 'rails_helper'

RSpec.describe Listing, type: :model do
  let(:profile) { Profile.new }
  subject { described_class.new(
    board_game_name: 'test',
    condition: 'Brand New in Shrink',
    listing_type: 'Sell',
    price: 10000,
    board_game_trade: nil,
    description: "Awesome game",
    completed: true,
    profile: profile
  )}

  context 'associations' do
    it 'belongs to a Profile' do
      relation = Listing.reflect_on_association(:profile)
      expect(relation.macro).to eql(:belongs_to)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without a board game name' do
      subject.board_game_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a condition' do
      subject.condition = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without listing type' do
      subject.listing_type = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without completed status' do
      subject.completed = nil
      expect(subject).to_not be_valid
    end

    it 'should default completed to false' do
      new_listing = Listing.new()
      expect(new_listing.completed).to eq false
    end

    it 'is not valid if listing type is Sell and price is nil' do
      subject.listing_type = 'Sell'
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if listing type is trade and board_game_trade is nil' do
      subject.listing_type = 'Trade'
      subject.board_game_trade = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if listing type is anything other than Trade or Sell' do
      subject.listing_type = 'Cash'
      expect(subject).to_not be_valid
    end

    it 'is not valid if condition is anything other than Brand New in Shrink, Played a few times, Unplayed but punched, Missing pieces, Dented box or Heavily played' do
      subject.condition = 'Unplayable'
      expect(subject).to_not be_valid
    end
  end
end
