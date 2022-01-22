FactoryBot.define do

  debugger
  factory :membership1 do
    user  {michael}
    talk  {talk1}
  end

  factory :membership2 do
    user  {archer}
    talk  {talk1}
  end

  50.times do |n|
    factory :"membership1_#{n}" do
      user  {michael}
      talk  {"talk_#{n}"}
    end
    factory :"membership1_#{n+50}" do
      user  {"user_#{n}"}
      talk  {"talk_#{n}"}
    end
  end

  factory :most_recent_membership1 do
      user  {michael}
      talk  {most_recent_talk}
  end

  factory :most_recent_membership2 do
    user  {lana}
    talk  {most_recent_talk}
  end
end
