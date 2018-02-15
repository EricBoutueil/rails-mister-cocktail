class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show] #, :edit, :update, :destroy]

  def index
    #on récupère un array d'instances
    @cocktails = Cocktail.all
  end
  def show
    # 1 seul
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end
  # def edit
  # end
  # def update
  #   @cocktail.update(cocktail_params)
  #   redirect_to cocktail_path(@cocktail)
  # end
  # def destroy
  #   @cocktail.destroy
  #   redirect_to cocktails_path
  # end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
