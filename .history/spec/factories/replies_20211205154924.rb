FactoryBot.define do
  factory :one do
    in_reply_to  {1}
    micropost    {one}
  end

  factory :two do
    in_reply_to  {1}
    micropost    {two}
  end
end
