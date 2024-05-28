class CaterersController < ApplicationController
  def show
    @caterer = Caterer.find(params[:id])
  end
end
