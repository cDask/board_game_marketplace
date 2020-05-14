require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:profile_author) { Profile.new }
  let(:profile_receiver) { Profile.new }
  subject { described_class.new(
    receiver_id: 1,
    author_id: 2
  )}
  context 'associations' do
    it 'belongs to an author' do
      # TODO
      # relation = Conversation.reflect_on_association(:author)
      # expect(relation.macro).to eql(:belongs_to)
    end

    it 'belongs to an receiver' do
      # TODO
      # relation = Conversation.reflect_on_association(:reciever)
      # expect(relation.macro).to eql(:belongs_to)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without an author' do
      subject.author_id = nil
      expect(subject).t_not be_valid
    end

    it 'is not valid without an reciever' do
      subject.receiver_id = nil
      expect(subject).t_not be_valid
    end

    it 'is not valid with author_id and reciever_id is the same' do
      subject.author_id = 1
      subject.reciever_id = 2
      expect(subject).t_not be_valid
    end
  end
end
