class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    if @dose.save # if success
      redirect_to cocktail_path(@cocktail)
    else # if failure
      render :new
      # redirect_to :back
    end
  end

  def destroy
  @dose = Dose.find(params[:id])
  @cocktail = @dose.cocktail
  @dose.destroy
  redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
