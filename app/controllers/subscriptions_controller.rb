class SubscriptionsController < ApplicationController
  def list
    @active_subscriptions = Booking.joins(:offer).where(user_id: current_user.id, offers: { status: false })
    @past_subscriptions = Booking.joins(:offer).where(user_id: current_user.id, status: "accepted", offers: { status: true })

    @pending_subscriptions = Booking.where(user_id: current_user.id, status: "pending")
    @accepted_subscriptions = Booking.where(user_id: current_user.id, status: "accepted")
    @rejected_subscriptions = Booking.where(user_id: current_user.id, status: "rejected")
  end
end
