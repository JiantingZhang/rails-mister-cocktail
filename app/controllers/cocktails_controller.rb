class CocktailsController < ApplicationController

def index
  @cocktails = Cocktail.all
end

def show
  @cocktail = Cocktail.find(params[:id])
end

def new
  @cocktail = Cocktail.new
end

def create
  @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
end

def edit
  @cocktail = Cocktail.find(params[:id])
end

def update
  @cocktail = Cocktail.find(params[:id])
  @cocktail.update(cocktail_params)
  if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
end

def destroy
  @cocktail = Cocktail.find(params[:id])
  @cocktail.destroy
  redirect_to cocktails_path
    # do not have a cocktail, so go to index instead
end

private

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end

end
