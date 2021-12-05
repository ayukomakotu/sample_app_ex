FactoryBot.define do
  factory :micheal do
    name             {Michael Example}
    email            {michael@example.com}
    password_digest  {User.digest('password')}
    admin            {true}
    activated        {true}
    activated_at     {true}
    follow_notify    {false}    
  end

  factory :archer do
    name             {Sterling Archer}
    email            {duchess@example.gov}
    password_digest  {User.digest('password')}
    activated        {true}
    activated_at     {true}
    follow_notify    {true}
  end

  factory :malory do
    name             {Malory Archer}
    email            {boss@example.gov}
    password_digest  {User.digest('password')}
    activated        {true}
    activated_at     {true}
    follow_notify    {true}
  end

  factory :jason do
    name             {jason Archer}
    email            {jason@example.gov}
    password_digest  {User.digest('password')}
    activated        {true}
    activated_at     {true}
    follow_notify    {true}
  end

  factory :non_notify do
    name             {non_notify}
    email            {non_notify@example.com}
    password_digest  {User.digest('password')}
    activated        {true}
    activated_at     {true}
    follow_notify    {true}
  end

  50.times do |n|
    factory :"user_#{n}" do
      name             {"User_#{n}"}
      email            {"user-#{n}@example.com"}
      password_digest  {User.digest('password')}
      activated        {true}
      activated_at     {true}
      follow_notify   {true}
    end
  end
end
