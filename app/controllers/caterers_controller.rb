class CaterersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    if params[:query].present?
      @caterers = Caterer.search_by_cuisine_and_address_and_caterer_name(params[:query])
    else
      @caterers = Caterer.all
    end
  end

  def show
    @caterer = Caterer.find(params[:id])
  end

  def new
    @caterer = Caterer.new
  end

  def create
    @caterer = Caterer.new(caterer_params)
    @caterer.user = current_user

    if @caterer.save
      redirect_to caterers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def caterer_params
    params.require(:caterer).permit(:name, :description, :address, :cuisine, :price_per_hour, :photo)
  end
end
