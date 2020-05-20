require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject { described_class.new(name: 'test')}

  # context 'associations' do
  #   it 'belongs to a User' do
  #     relation = Profile.reflect_on_association(:user)
  #     expect(relation.macro).to eql(:belongs_to)
  #   end
  # end

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
