class ListingsController < ApplicationController
  def list
    @active_offers = current_user.offers.where(status: true)
    @past_offers = current_user.offers.where(status: false)

    @pending_requests = Booking.joins(offer: :user).where(status: "pending", offers: { user_id: current_user.id })
    @accepted_requests = Booking.joins(offer: :user).where(status: "accepted", offers: { user_id: current_user.id })
    @rejected_requests = Booking.joins(offer: :user).where(status: "rejected", offers: { user_id: current_user.id })
  end
end
