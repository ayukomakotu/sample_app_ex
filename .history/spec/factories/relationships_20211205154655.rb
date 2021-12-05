FactoryBot.define do
  factory :one do
    follower  {michael}
    followed  {lana}
  end

  factory :two do
    follower  {michael}
    followed  {malory}
  end

  factory :three do
    follower  {lana}
    followed  {michael}
  end

  factory :four do
    follower  {archer}
    followed  {michael}
  end
end
