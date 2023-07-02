FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { "welcome" }
    password_confirmation { "welcome" }
    total_transaction_sum { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
    status { 'active' }

    factory :admin, parent: :user, class: Admin do
      type { "Admin" }
    end

    factory :merchant, parent: :user, class: Merchant do
      type { "Merchant"}
    end
  end
end
