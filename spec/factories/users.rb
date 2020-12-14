FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { '123123' }
  end
end
