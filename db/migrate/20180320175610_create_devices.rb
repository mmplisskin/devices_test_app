class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :user_agent, null: false
      t.string :language, null: false
      t.integer :screen_height, null: false
      t.integer :screen_width, null: false
      t.string :time_zone, null: false
      t.boolean :local_storage, null: false
      t.boolean :session_storage, null: false
      t.boolean :cookies, null: false
      t.boolean :indexed_db, null: false
      t.string :uuid_fingerprint, null: false, index: {unique: true}
      t.string :platform, null: false
      t.boolean :mobile, null: false
      t.jsonb :touch_support, default: '{}'
      t.string :app_bundle_id
      t.string :app_version
      t.string :model
      t.string :plugins, array: true, default: []

      t.timestamps
    end
  end
end
