class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy, :update, :edit]
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # we need `cocktail_id` to asssociate dose with corresponding restaurant
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def edit
  end

  def update
    cocktail = @dose.cocktail
    @dose.update_attributes(dose_params)
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(cocktail), notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
