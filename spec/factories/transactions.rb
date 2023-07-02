FactoryBot.define do
  factory :transaction do
    uuid { SecureRandom.uuid }
    customer_email { Faker::Internet.unique.email }
    customer_phone { Faker::PhoneNumber.unique.cell_phone }
    amount { Faker::Number.decimal(l_digits: 2) }
    status { 'active' }
  end
end
