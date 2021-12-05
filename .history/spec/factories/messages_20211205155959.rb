FactoryBot.define do
  factory :test_message1 do
    talk        {talk1}
    user        {michael}
    content     {test_message}
    created_at  {10.minutes.ago}
  end

  factory :test_message2 do
    talk        {talk1}
    user        {archer}
    content     {test_message2}
    created_at  {20.minutes.ago}
  end

  50.times do |n|
    factory :"message_#{n}" do
      talk        {talk_"#{n}"}
      user        {user_"#{n}"}
      content     {Faker::Lorem.sentence(word_count: 5)}
      created_at  {1.days.ago}
    end
    factory :"message_#{n+50}" do
      talk        {talk_"#{n}"}
      user        {michael}
      content     {Faker::Lorem.sentence(word_count: 5)}
      created_at  {2.days.ago}
    end
  end

  factory :most_recent do
    talk        {most}
    user        {archer}
    content     {test_message2}
    created_at  {20.minutes.ago}
  end
end
