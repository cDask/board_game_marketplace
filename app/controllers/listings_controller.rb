class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @listings = Listing.all
  end

  def show; end

  def new
    @listing = Listing.new
  end

  def edit; end

  def create
    @listing = current_user.profile.listings.create(listing_params)
    if @listing.errors.any?
      render :new
    else
      flash[:success] = 'You successfully created a new listing!'
      redirect_to root_path
    end
  end

  def update
    if @listing.update(listing_params)
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

  def listing_params
    params.require(
      :listing
    ).permit(
      :board_game_name, :condition, :listing_type,
      :price, :board_game_trade, :description,
      :completed, :profile, :picture, :completed
    )
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
