FactoryBot.define do
  factory :rep1 do
    in_reply_to  {1}
    micropost    {one}
  end

  factory :rep2 do
    in_reply_to  {1}
    micropost    {two}
  end
end
