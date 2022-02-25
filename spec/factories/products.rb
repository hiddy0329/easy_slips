FactoryBot.define do
  factory :product do
    item_number { 111111 }
    name {"テスト商品A"}
    color {"赤"}
    price {"10000"}
    note {"あいうえおかきくけこさしすせそたちつてと"}
    availability { 1 }
  end
end
