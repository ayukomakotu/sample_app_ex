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
end
