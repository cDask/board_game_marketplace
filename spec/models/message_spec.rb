require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:profile) { Profile.new }
  let(:conversation) { Conversation.new }
  subject { described_class.new(
    profile: profile,
    conversation: conversation,
    body: 'Hello World'
  )}
  context 'associations' do
    it 'belongs to a conversation' do
      relation = Messsage.reflect_on_association(:conversation)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'belongs to an profile' do
      relation = Message.reflect_on_association(:profile)
      expect(relation.macro).to eql(:belongs_to)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without a message body' do
      subject.body = nil
      expect(subject).t_not be_valid
    end
  end
end
