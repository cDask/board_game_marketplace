class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource

  def index
    @listings = Listing.with_attached_picture.includes(
      :profile
    ).where(completed: false, deleted: false)
  end

  def show; end

  def new
    # Check if current user has a profile
    if current_user.profile
      @listing = Listing.new
      @payments = Payment.all
    else
      flash[:alert] = 'Please create your profile first'
      redirect_to new_profile_path
    end
  end

  def edit
    @payments = @listing.payments
  end

  def create
    @listing = current_user.profile.listings.create(listing_params)
    add_payments
    if @listing.errors.any?
      render :new
    else
      flash[:success] = 'You successfully created a new listing!'
      redirect_to @listing
    end
  end

  def update
    if @listing.update(listing_params)
      update_listing_payment(@listing)
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.deleted = true
    @listing.save
    redirect_to root_path
  end

  private

  def update_listing_payment(listing)
    listing.payments.delete_all
    return unless params[:payment_ids]

    params[:payment_ids].each do |p|
      listing.payments << Payment.find(p)
    end
  end

  def add_payments
    return unless params[:payment_ids]

    params[:payment_ids].each do |p|
      @listing.payments << Payment.find(p)
    end
  end

  def listing_params
    params.require(
      :listing
    ).permit(
      :board_game_name, :condition, :listing_type,
      :price, :board_game_trade, :description,
      :profile, picture: []
    )
  end

  def payment_params
    # params.require(:payments_ids).permit()
  end

  def set_listing
    @listing = Listing.with_attached_picture.includes(
      :payments
    ).includes(:profile).find(params[:id])
  end
end
