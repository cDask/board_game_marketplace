require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    email: 'test@boardgamesexchange.com',
    password: 'password',
    is_admin: true
  )}
  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with password less than 8 characters' do
      subject.password = '123456'
      expect(subject).to_not be_valid
    end

    it 'is not valid without an admin status' do
      subject.is_admin = nil
      expect(subject).to_not be_valid
    end

    it 'should default admin status to false' do
      non_admin_subject = User.new()
      expect(non_admin_subject.is_admin).to eq false
    end
  end
end
