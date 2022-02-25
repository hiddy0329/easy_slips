FactoryBot.define do
  factory :client do
    name {Faker::Name.name}
    availability { 1 }
    created_at {Date.current.strftime('%Y/%m/%d')}
  end
end
