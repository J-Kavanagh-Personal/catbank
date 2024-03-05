# frozen_string_literal: true

FactoryBot.define do
  factory(:balance) do
    user_id { FactoryBot.create(:user).id }
    amount_in_pennies { Faker::Number.number(digits: 5) }
  end
  factory(:deposit) do
    payee_id { FactoryBot.create(:user).id }
    amount_in_pennies { Faker::Number.number(digits: 5) }
  end
  factory(:transaction) do
    payee_id { FactoryBot.create(:user).id }
    payer_id { FactoryBot.create(:user).id }
    amount_in_pennies { Faker::Number.number(digits: 5) }
  end
  factory(:user) do
    email { Faker::Internet.email }
    password { "123456" }
  end
end