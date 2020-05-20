class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :profile
  validates :body, presence: true
end
