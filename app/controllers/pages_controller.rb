class PagesController < ApplicationController
  def home
  end

  def dashboard
    @caterers = Booking.where(user_id: current_user.id).map(&:caterer)
  end
end
