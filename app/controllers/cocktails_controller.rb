class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new(user_params)
    if cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:cocktail).permit(:name)
  end
end
