# メインのサンプルユーザーを1人作成する
User.create!(name:                  "Example User",
             email:                 "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:                 true)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@prode.org"
password = "password"
User.create!( name:                  name,
              email:                 email,
              password:              password,
              password_confirmation: password )
end

# ユーザーフォローのリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# マイクロポストの一部を対象にコメントを生成する
microposts = Micropost.order(:created_at).take(6)
users = User.order(:created_at).take(6)
microposts.each do |micropost|
  users.each do |user|
    content = Faker::Lorem.sentence(word_count: 5)
    micropost.comments.create!(content: content, user: user)
  end
end
