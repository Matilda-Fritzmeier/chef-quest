class CaterersController < ApplicationController
  def index
    @caterers = Caterer.all
  end
end
