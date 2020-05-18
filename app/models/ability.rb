# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all if user.is_admin?
    can %i[index show new create], Listing
    can %i[edit update destroy], Listing, profile: user.profile
    profile_permissions(user)
    can :manage, Conversation, profile: user.profile
  end

  def profile_permissions(user)
    can %i[new create], Profile
    can %i[index show edit], Profile, user_id: user.id
  end
end
