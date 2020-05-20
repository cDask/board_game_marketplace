# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Set a guest user if no user is not logged in
    user ||= User.new
    profile = user.profile
    profile ||= Profile.new
    admin_permissions(user)
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
    can %i[index], Profile, user: user.is_admin?
    can %i[show edit], Profile, user_id: user.id
  end

  def admin_permissions(user)
    return unless user && user.is_admin?

    can :manage, :all
    can :access, :rails_admin # only allow admin users to access Rails Admin
    can :read, :dashboard
  end
end
