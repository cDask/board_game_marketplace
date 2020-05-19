class ProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_profile, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def show
    @listings = @profile.listings
    @active_listings = @listings.reject(&:completed)
    @past_listings = @listings.select(&:completed)
    @transactions = @profile.transactions
  end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    # TODO: Find out why old method didnt work
    # @profile = current_user.profile.create(profile_params)
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
    if @profile.errors.any?
      render :new
    else
      flash[:success] = 'You successfully created a new profile!'
      redirect_to root_path
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :rating, :user, :profile_pic)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
