# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    profile = user.profile
    profile ||= Profile.new
    can :manage, :all if user.is_admin?
    can %i[index show new create], Listing
    can %i[edit update destroy], Listing, profile: profile
    profile_permissions(user)
    can :manage, Conversation, author_id: profile.id
    can :manage, Conversation, receiver_id: profile.id
  end

  def profile_permissions(user)
    can %i[new create], Profile do
      user.profile.nil?
    end
    can %i[index show edit], Profile, user_id: user.id
  end
end
