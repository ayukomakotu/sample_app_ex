FactoryBot.define do
  factory :orange do
    content    {"I just ate an orange!"}
    created_at {10.minutes.ago}
    user       {michael}
  end

  factory :tau_manifesto do
    content    {"Check out the @tauday site by @mhartl: https://tauday.com"}
    created_at {3.years.ago}
    user       {michael}
  end

  factory :cat_video do
    content    {"Sad cats are sad: https://youtu.be/PKffm2uI4dk"}
    created_at {2.hours.ago}
    user       {michael}
  end

  factory :most_recent do
    content    {"Writing a short test"}
    created_at {Time.zone.now}
    user       {michael}
  end

  30.times do |n|
    factory :"micropost_#{n}" do
      content    {Faker::Lorem.sentence(word_count: 5)}
      created_at {42.doys.ago}
      user       {michael}
    end
  end

  factory :ants do
    content    {"Oh, is that what you want? Because that's how you get ants!"}
    created_at {2.years.ago}
    user       {archer}
  end

  factory :zone do
    content    {"Danger zone!"}
    created_at {3.days.ago}
    user       {archer}
  end

  factory :tone do
    content    {"I'm sorry. Your words made sense, but your sarcastic tone did not."}
    created_at {10.minutes.ago}
    user       {archer}
  end

  factory :van do
    content    {"Dude, this van's, like, rolling probable cause."}
    created_at {4.hours.ago}
    user       {archer}
  end

  factory :reply do
    content    {"@Michael Example\nreply test"}
    created_at {4.hours.ago}
    user       {archer}
  end
end
