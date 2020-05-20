class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'
  # validates :author_id, uniqueness: { scope: :receiver_id }
  validate :author_and_receiver_unique
  has_many :messages,
           -> { order(created_at: :asc) },
           dependent: :destroy,
           inverse_of: 'conversation'
  scope :participating, lambda { |profile|
    where(
      '(conversations.author_id = ? OR conversations.receiver_id = ?)',
      profile.id, profile.id
    )
  }
  scope :between, lambda { |sender_id, receiver_id|
    where(
      author_id: sender_id,
      receiver_id:
      receiver_id
    ).or(
      where(
        author_id: receiver_id,
        receiver_id: sender_id
      )
    ).limit(1)
  }

  def with(current_profile)
    author == current_profile ? receiver : author
  end

  def participates?(user)
    [author, receiver].include?(user)
  end

  private

  def author_and_receiver_unique
    return unless author_id == receiver_id

    errors.add(
      :author_and_receiver_unique,
      'Author and receiver cant be the same person'
    )
  end
end
