class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to @dose, notice: 'Dose was successfully created.'
    else
      render :new
    end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private
  def dose_params
    params.require(:dose).permit(:name)
  end
  def set_dose
    @dose = Dose.find(params[:id])
  end

end

