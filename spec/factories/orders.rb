FactoryBot.define do
  factory :order do
    order_number { 1111111 }
    color { "赤" }
    count { 300 }
    note {"あいうえおかきくけこさしすせそたちつてと"}
    association :slip
  end
end
