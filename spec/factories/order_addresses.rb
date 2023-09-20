FactoryBot.define do
  factory :order_address do
    postcode               { '123-4567'}
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city { '北海道'}
    block { '1-1' }
    building { '札幌ハイツ'}
    phone_number { '00123456789' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
