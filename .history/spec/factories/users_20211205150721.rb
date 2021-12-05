FactoryBot.define do
  factory :micheal do
    name             {Michael Example}
    email            {michael@example.com}
    password_digest  {User.digest('password')}
    admin            {true}
    activated:       {true}
    activated_at:    {true}
    follow_notify:   {false}    
  end

  factory :archer do
    name             {Sterling Archer}
    email            {duchess@example.gov}
    password_digest  {User.digest('password')}
    activated:       {true}
    activated_at:    {true}
    follow_notify:   {true}
  end
end
