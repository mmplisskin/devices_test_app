class Device < ApplicationRecord
  
  validates_presence_of :user_agent, :language, :screen_height, :screen_width,
                          :time_zone, :uuid_fingerprint, :platform
  # boolean validations
  validates_inclusion_of :local_storage, :session_storage, :cookies,
                          :indexed_db, :mobile, in: [true, false]

  validates_numericality_of :screen_width, :screen_height

  validates_presence_of :app_bundle_id, :app_version, message: "Can't be blank for mobile devices.", if: :mobile?

  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.all.map { |tz| tz.tzinfo.name }



end
