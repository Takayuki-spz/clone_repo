# メインのサンプルユーザーを1人作成する
User.create!(name:                  "山田 太郎",
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
users = User.order(:created_at).take(90)
25.times do
  content = '今日は、Railsのチュートリアルを進めました。MVCアーキテクチャやルーティングの仕組みを理解し、CRUDアプリケーションの作成に挑戦しました!'
  study_time_hour = rand(1..12)
  study_time_minute = rand(0..11) * 5
  users.each { |user| user.microposts.create!(content: content, study_time_hour: study_time_hour, study_time_minute: study_time_minute) }
end

# マイクロポストの一部を対象にコメントを生成する
microposts = Micropost.order(:created_at).take(1500)
users = User.order(:created_at).take(9)
microposts.each do |micropost|
  users.each do |user|
    content = 'Railsのチュートリアルを進めることで、MVCアーキテクチャやルーティングの理解を深め、CRUDアプリケーションの作成に挑戦したのは素晴らしいですね!これからも頑張ってください!'
    micropost.comments.create!(content: content, user: user)
  end
end