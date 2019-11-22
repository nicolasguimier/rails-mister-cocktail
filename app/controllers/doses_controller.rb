class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all.order(:name)
  end

  def create
    # raise
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # @dose = Dose.create({ description: '3cl', ingredient: Ingredient.first, cocktail: Cocktail.first })
    # raise
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
