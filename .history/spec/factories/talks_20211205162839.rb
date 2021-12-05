FactoryBot.define do
  factory :talk1 do
    updated_at: 10.minutes.ago
  end

  factory :talk2 do
    updated_at: 2.hours.ago
  end

  factory :most_recent_talk do
    updated_at: Time.zone.now
  end
end
