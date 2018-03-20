FactoryBot.define do
  factory :device do
    user_agent {Faker::Internet.user_agent}
    language {Faker::ProgrammingLanguage.name}
    screen_height {Faker::Number.between(256, 5000)}
    screen_width {Faker::Number.between(256, 5000)}
    time_zone  {Faker::Address.time_zone}
    local_storage {[true, false].sample}
    session_storage {[true, false].sample}
    cookies {[true, false].sample}
    indexed_db {[true, false].sample}
    uuid_fingerprint {Faker::Crypto.md5}
    platform {Faker::ProgrammingLanguage.name}
    mobile {[true, false].sample}
    touch_support  {(0..10).to_a.sample.times.with_object({}){|v, r| r[Faker::Internet.domain_word] = true}}
    app_bundle_id {Faker::Number.decimal(2)}
    app_version {Faker::Number.decimal(2)}
    model {Faker::ProgrammingLanguage.name}
    plugins {(0..10).to_a.sample.times.inject([]){ |r| r <<  Faker::Internet.domain_word}}
  end

  factory :mobile_device, parent: :device do
    mobile true
  end


end
