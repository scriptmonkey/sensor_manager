# Controller for the ds18b20 model
class Ds18b20sController < ApplicationController

  def new
    @ds18b20 = Ds18b20.new
  end

  def create
    temp_sensor = Ds18b20.new(ds18b20_params)
    if temp_sensor.valid?
      temp_sensor.save
      redirect_to home_path
    else
      redirect_to new_ds18b20_path
    end
  end

  def show
    @ds18b20 = Ds18b20.find(params[:id])
  end

  def edit
    @ds18b20 = Ds18b20.find(params[:id])
  end

  def update
    temp_sensor = Ds18b20.find(params[:id])
    temp_sensor.update_attributes(ds18b20_params)
    if temp_sensor.valid?
      redirect_to home_path
    else
      redirect_to edit_ds18b20_path(temp_sensor)
    end
  end

  private

  def ds18b20_params
    params.require(:ds18b20).permit(
      :name,
      :path,
      :file
   )

  end
end
