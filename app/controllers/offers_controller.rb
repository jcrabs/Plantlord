class OffersController < ApplicationController
  def index
    @offers = Offer.all
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

  def show
    @offer = Offer.find(params[:id])
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
