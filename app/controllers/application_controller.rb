class ApplicationController < ActionController::Base
  before_action :retrieve_listings
  rescue_from CanCan::AccessDenied do |_exception|
    render file: Rails.root.join('/public/403.html'), status: :forbidden
  end

  private

  def retrieve_listings
    # Query database for all unsold listings
    unsold_listings = Listing.with_attached_picture.includes(
      :profile
    ).where(completed: false, deleted: false)
    @q = unsold_listings.ransack(params[:q])
    @listings = @q.result(distinct: true)
  end
end
