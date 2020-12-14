FactoryBot.define do
  factory :post do
    title { FFaker::Lorem.phrase }
    body { FFaker::Lorem.phrase }
  end
end
