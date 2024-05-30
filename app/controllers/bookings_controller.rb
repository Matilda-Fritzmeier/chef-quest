class BookingsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @caterer = Caterer.find(params[:caterer_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.caterer_id = params[:caterer_id]
    @booking.user_id = current_user.id
    # @booking.total_price = @booking.caterer.price_per_hour * (@booking.end_hour - @booking.start_hour) / 1.hour

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :location, :start_hour, :end_hour, :guests_count)
  end
end
