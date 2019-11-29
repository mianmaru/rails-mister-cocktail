class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(user_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id].to_i)
    cocktail_id = dose.cocktail_id
    dose.destroy
    redirect_to cocktail_path(cocktail_id)
  end

  private
  def user_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
