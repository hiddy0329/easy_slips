FactoryBot.define do
  factory :product do
    item_number {Faker::Number.number(digits: 10)}
    name {Faker::Name.name}
    color {"赤"}
    price {"10000"}
    note {"あいうえおかきくけこさしすせそたちつてと"}
    availability { 1 }
    created_at {Date.current.strftime('%Y/%m/%d')}
  end
end
