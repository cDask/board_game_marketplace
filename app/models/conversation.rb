class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'
  validates :author, uniqueness: { scope: :receiver }
  has_many :personal_messages,
           -> { order(created_at: :asc) },
           dependent: :destroy,
           inverse_of: 'messages'
end
