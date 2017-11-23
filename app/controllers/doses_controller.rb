class DosesController < ApplicationController
  before_action :set_dose

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

  # def update
  # end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
