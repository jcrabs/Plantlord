class OffersController < ApplicationController
  def index
    if params[:query].present?
      @offers = Offer.global_search(params[:query])
    else
      @offers = Offer.all
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

  def show
    @offer = Offer.find(params[:id])
  end

  def delete
    @offer = Offer.find(params[:id])
    @offer.destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:plant_name, :plant_description, :price, :photo)
  end
end
