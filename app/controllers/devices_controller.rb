class DevicesController < ApplicationController

# insert or initialize a record that matches the uuid_fingerprint
# update the device with device parameters
# if the device updates successfully render the device
# else render the device errors and reject the update
  def create
    @device = Device.find_or_initialize_by(uuid_fingerprint: params[:device][:uuid_fingerprint])
    if @device.update(device_params)
      render json: @device
    else
      render json: {errors: @device.errors }, status: 422
    end
  end


  private

  def device_params
    params.require(:device).permit(
      %W(
        user_agent language screen_height screen_width time_zone local_storage
        session_storage cookies indexed_db platform mobile
        touch_support app_bundle_id app_version model plugins
      )
    )
  end


end
