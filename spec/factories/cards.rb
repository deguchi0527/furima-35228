FactoryBot.define do
  factory :card do
    card_token { 'tok_abcdefghijk00000000000000000' }
    customer_token { 'cus_17ed0a3600000000000000000000' }
    association :user
  end
end
