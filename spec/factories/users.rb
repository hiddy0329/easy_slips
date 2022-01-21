FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6, mix_case: true)
    password {password}
    password_confirmation {password}
    postal_code { "123-4567" }
    prefecture_id { 2 }
    city { "佐藤市田中区" }
    address { "山田1-1-1" }
    building_name { "アーバンプレイス伊藤202" }
    phone_number { "09012345678" }
  end
end