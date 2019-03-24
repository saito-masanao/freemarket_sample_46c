# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Brand.create!([
 { id: 1, name:'シャネル'},
 { id: 2, name: 'ナイキ' },
 { id: 3, name: 'ルイヴィトン' },
 { id: 4, name: 'シュプリーム' },
 { id: 5, name: 'アディダス' },
 { id: 6, name: 'その他' },
])

Category.create!([
 { id: 1, name:'レディース' },
 { id: 2, name: 'メンズ' },
 { id: 3, name: 'ベビー・キッズ' },
 { id: 4, name: 'インテリア・住まい・小物' },
 { id: 5, name: '本・音楽・ゲーム' },
 { id: 6, name: 'おもちゃ・ホビー・グッズ' },
 { id: 7, name:'コスメ・香水・美容' },
 { id: 8, name: '家電・スマホ・カメラ' },
 { id: 9, name: 'スポーツ・レジャー' },
 { id: 10, name: 'ハンドメイド' },
 { id: 11, name: 'チケット' },
 { id: 12, name: '自動車・オートバイ' },
 { id: 13, name: 'その他' },
])

100.times do |n|
 name = Faker::Pokemon.name
 email = Faker::Internet.email
 password = "password"
 birthday =Faker::Time.between(40.years.ago, 18.years.ago, :all).to_s[0, 10]
 User.create!(nickname: name,
              email: email,
              password: password,
              birthday: birthday
             )
end
