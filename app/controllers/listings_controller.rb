class ListingsController < ApplicationController
  def list
    @active_offers = current_user.offers.where(status: true)
    @past_offers = current_user.offers.where(status: false)
  end
end
