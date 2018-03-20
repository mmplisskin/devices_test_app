require 'test_helper'

class DevicesControllerTest < ActionDispatch::IntegrationTest

  # NOTE: (Max Plisskin): add a method to include headers in each request


  def test_devices_create_or_update
    #create a device
    @device = FactoryBot.build(:device)
    assert_difference 'Device.count' do
      post devices_path, params: @device.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_response :ok
    end
    # check the same device does not create duplicate records
    assert_no_difference 'Device.count' do
      post devices_path, params: @device.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_response :ok
    end

    # reload the above device in order to compare attributes later
    @original_device = Device.find_by(uuid_fingerprint: @device.uuid_fingerprint)

    # initialize a device with different attributes but the same uuid
    @device_two = FactoryBot.build(:device, uuid_fingerprint: @original_device.uuid_fingerprint)

    # assert that no duplicate devices are created
    assert_no_difference 'Device.count' do
      post devices_path, params: @device_two.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_response :ok
    end
    # ensure that the device is updated with a new attribute (we could dynamically check others)
    assert_not_equal @original_device.user_agent, @device_two.user_agent
  end

  def test_invalid_devices_return_unprocessible_entity
    assert_no_difference 'Device.count' do
      @device = FactoryBot.build(:mobile_device, app_bundle_id: nil)
      post devices_path, params: @device.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      assert_response :unprocessable_entity
    end
  end


end
