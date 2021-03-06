# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:        true,
             activated:    true,
             activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated:    true,
               activated_at: true)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

(0..49).each do |n|
  Talk.create!
  Membership.create!(talk_id: n+1, user_id: users[n].id)
  if n==0
    Membership.create!(talk_id: n+1, user_id: users[49].id)
  else
    Membership.create!(talk_id: n+1, user_id: users[0].id)
  end
end
(0..49).each do |n|
  content = Faker::Lorem.sentence(word_count: 5)
  Message.create!(talk_id: n+1, user_id: users[n].id, content: content)
  Message.create!(talk_id: n+1, user_id: users[0].id, content: content)
end

(0..25).each do |n|
  content = Faker::Lorem.sentence(word_count: 5)
  Message.create!(talk_id: 1, user_id: users[0].id, content: content)
  Message.create!(talk_id: 1, user_id: users[1].id, content: content)
end