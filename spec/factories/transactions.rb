FactoryBot.define do
  factory :transaction do
    uuid { "MyString" }
    customer_email { "MyString" }
    customer_phone { "MyString" }
    status { 1 }
  end
end
