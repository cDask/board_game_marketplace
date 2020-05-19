# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    profile = user.profile
    profile ||= Profile.new
    can :manage, :all if user.is_admin?
    listing_permissions(user, profile)
    can %i[edit update destroy], Listing, profile: profile
    profile_permissions(user)
    can :manage, Conversation, author_id: profile.id
    can :manage, Conversation, receiver_id: profile.id
  end

  def listing_permissions(_user, profile)
    can %i[index show new create], Listing
    cannot [:show], Listing do |listing|
      listing.deleted && !profile.transactions.pluck(
        :listing_id
      ).include?(listing.id)
    end
  end

  def profile_permissions(user)
    can %i[new create], Profile do
      user.profile.nil?
    end
    can %i[index show edit], Profile, user_id: user.id
  end
end
