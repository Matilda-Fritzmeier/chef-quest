class CaterersController < ApplicationController
  def index
    @caterers = Caterer.all
  end

  def show
    @caterer = Caterer.find(params[:id])
  end
end
