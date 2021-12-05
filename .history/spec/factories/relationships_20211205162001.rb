FactoryBot.define do
  factory :relation1 do
    follower  {michael}
    followed  {lana}
  end

  factory :relation2 do
    follower  {michael}
    followed  {malory}
  end

  factory :relation3 do
    follower  {lana}
    followed  {michael}
  end

  factory :relation4 do
    follower  {archer}
    followed  {michael}
  end
end
