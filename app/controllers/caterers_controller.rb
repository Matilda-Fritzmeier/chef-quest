class CaterersController < ApplicationController
  def index
    @caterers = Caterer.all
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
    params.require(:caterer).permit(:description, :address, :cuisine, :price_per_hour)
  end
end
