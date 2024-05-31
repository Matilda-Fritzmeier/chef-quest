class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @bookings = Booking.where(user: current_user)
    @received_bookings = current_user.caterers.map(&:bookings).flatten
  end

  def new
    @booking = Booking.new
    @caterer = Caterer.find(params[:caterer_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.caterer_id = params[:caterer_id]
    @booking.user_id = current_user.id
    @booking.total_price = @booking.caterer.price_per_hour * (@booking.end_hour - @booking.start_hour) / 1.hour

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :location, :start_hour, :end_hour, :guests_count)
  end
end
