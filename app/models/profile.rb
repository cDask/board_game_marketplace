class Profile < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :listings
  has_many :authored_conversations,
           class_name: 'Conversation',
           foreign_key: 'author_id',
           inverse_of: 'author'
  has_many :received_conversations,
           class_name: 'Conversation',
           foreign_key: 'received_id',
           inverse_of: 'receiver'
  has_many :messages, dependent: :destroy
  validates :username, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 500 }
  validates :rating, numericality: { greater_than_or_equal_to: 100 }
end
