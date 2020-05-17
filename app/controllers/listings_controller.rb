class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource

  def index
    @listings = Listing.all
  end

  def show; end

  def new
    @listing = Listing.new
    @payments = Payment.all
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
      # TODO: FIX PAYMENT UPDATES
      params[payment_ids].each do |p|
        @listing.payments << Payment.find_by(name: p)
      end
      redirect_to @listing
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end

  private

  def add_payments
    return unless params[:payments]

    payment_params[:name].each do |p|
      @listing.payments << Payment.find_by(name: p)
    end
  end

  def listing_params
    params.require(
      :listing
    ).permit(
      :board_game_name, :condition, :listing_type,
      :price, :board_game_trade, :description,
      :completed, :profile, :completed, picture: []
    )
  end

  def payment_params
    params.require(:payments).permit(name: [])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
