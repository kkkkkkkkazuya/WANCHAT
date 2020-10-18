user1 = User.create!(name: "和也", email: "kazuya@hoge", password: "password")
user2 = User.create!(name: "ゆうき", email: "yuhki@hoge", password: "password")
user3 = User.create!(name: "かな", email: "kana@hoge", password: "password")

user1.posts.create!(content: "ミニチュアダックス可愛い")
user2.posts.create!(content: "どんな犬がおすすめですか？")
user3.posts.create!(content: "大型犬がおすすめですよ！")
user3.posts.create!(content: "ゴールデンレトリバー賢いですよ！")
user1.posts.create!(content: "柴犬もいいと思います！")

puts "初期データ転送完了しました。"
