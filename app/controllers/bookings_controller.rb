class BookingsController < ApplicationController

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to subscriptions_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "accepted")
    redirect_to listings_path(active_tab: "incoming-requests")
  end

  def Rejected
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "rejected")
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :duration)
  end

end
