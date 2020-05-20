class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :retrieve_all_payments
  load_and_authorize_resource

  def index; end

  def show; end

  def new
    # Check if current user has a profile
    if current_user.profile
      # Initialise a new Listing
      @listing = Listing.new
    else
      flash[:alert] = 'Please create your profile first'
      redirect_to new_profile_path
    end
  end

  def edit
    @listing.price /= 100.00
    @payments = @listing.payments
  end

  def create
    @listing = current_user.profile.listings.create(listing_params)
    add_payments
    if @listing.errors.any?
      render :new
    else
      @listing.completed = false
      @listing.save
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
    add_payments
  end

  def retrieve_all_payments
    # Query the database for all payments options to be added to new listings
    @all_payments = Payment.all
  end

  def add_payments
    return unless params[:payment_ids]

    # Get all Payment options
    @payments = Payment.all
    params[:payment_ids].each do |p|
      @listing.payments << @payments.find(p)
    end
  end

  def listing_params
    prms = params.require(
      :listing
    ).permit(
      :board_game_name, :condition, :listing_type,
      :price, :board_game_trade, :description,
      :profile, picture: []
    )
    # change price to cents
    prms[:price] = prms[:price].to_f * 100
    prms
  end

  def payment_params
    # params.require(:payments_ids).permit()
  end

  def set_listing
    # Get the Listing from the database with its images and associated payments
    @listing = Listing.with_attached_picture.includes(
      :payments
    ).includes(:profile).find(params[:id])
  end
end
