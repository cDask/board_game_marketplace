require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:user) { User.new }
  subject { described_class.new(
    username: 'test',
    rating: 400,
    user: user
  )}
  context 'associations' do
    it 'belongs to a User' do
      relation = Profile.reflect_on_association(:user)
      expect(relation.macro).to eql(:belongs_to)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with non unique username' do
      # TODO
      pending "add some examples to (or delete) #{__FILE__}"
    end

    it 'is not valid with rating below 100' do
      subject.rating = 50
      expect(subject).to_not be_valid
    end

    it 'is not valid with a rating above 500' do
      subject.rating = 501
      expect(subject).to_not be_valid
    end

    it 'is calculating average rating' do
      # TODO
      pending "add some examples to (or delete) #{__FILE__}"
    end
  end
end
