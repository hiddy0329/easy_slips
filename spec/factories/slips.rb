FactoryBot.define do
  factory :slip do
    address_name {Faker::Name.name}
    shipping_date {Faker::Date.in_date_period}
    slip_number {Faker::Number.number(digits: 11)}
    invoice_number {Faker::Number.number(digits: 11)}
  end
end
