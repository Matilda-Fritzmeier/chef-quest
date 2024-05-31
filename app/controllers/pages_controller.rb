class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def dashboard
    @caterers = current_user.caterers

    @bookings = Booking.where(user: current_user)
    # @booking = Booking.find(params[:booking_id])
    # @booking = @bookings.last
    # @caterer = @booking.caterer
    @data = []
    caterers = []
    @bookings.each do |booking|
      @caterer = booking.caterer

      caterers << @caterer unless caterers.include?(@caterer)

      @booking = booking
      @distance = Geocoder::Calculations.distance_between([@booking.latitude, @booking.longitude],
                                                          [@caterer.latitude, @caterer.longitude])
      data = {
        latitude: @booking.latitude,
        longitude: @booking.longitude,
        label: "Event Location",
        tooltip: @distance.round(2).to_s + " km"
      }
      @data << data
    end

    caterers.each do |caterer|
      @data <<
        {
          latitude: caterer.latitude,
          longitude: caterer.longitude,
          label: "Caterer Location",
          tooltip: "You"
        }
    end
  end
end
