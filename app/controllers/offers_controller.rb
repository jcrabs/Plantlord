class OffersController < ApplicationController
  def index
    if params[:query].present?
      @offers = Offer.global_search(params[:query]).where(status: true)
    else
      @offers = Offer.where(status: true)
    end
  end

  def show
    @booking = Booking.new
    @offer = Offer.find(params[:id])
    if user_signed_in?
      @already_booked = Booking.where(user_id: current_user.id, offer_id: @offer)
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    # No need for app/views/offers/create.html.erb
    redirect_to offer_path(@offer)
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:plant_name, :plant_description, :price, :photo)
  end
end
