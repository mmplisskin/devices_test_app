require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # creates device
  # initialize a new record with the same attributes
  # assert that ActiveRecord::RecordNotUnique is raised as a result of the uniqueness database constraint
  def test_duplicate_devices_not_created
    @device = FactoryBot.create(:device)
    assert_no_difference 'Device.count' do
      assert_raises ActiveRecord::RecordNotUnique do
        @device_dup = @device.dup
        @device_dup.save!
      end
    end
    pp @device
  end

  def test_mobile_devices_require_version
    @device = FactoryBot.build(:mobile_device, app_version: nil, app_bundle_id: nil)
    assert @device.invalid?
  end




end
