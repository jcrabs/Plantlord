class SubscriptionsController < ApplicationController
  def list
    @active_subscriptions = Booking.joins(:offer).where(user_id: current_user.id, offers: { status: true })
    @past_subscriptions = Booking.joins(:offer).where(user_id: current_user.id, offers: { status: false })

    @pending_subscriptions = Booking.where(user_id: current_user.id, status: "pending")
  end
end
