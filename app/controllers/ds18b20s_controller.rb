# Controller for the ds18b20 model
class Ds18b20sController < ApplicationController

  def new
    @ds18b20 = Ds18b20.new
  end

  def create
    temp_sensor = Ds18b20.new(ds18b20_params)
    temp_sensor.save
    redirect_to home_path
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
