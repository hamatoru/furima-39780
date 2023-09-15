FactoryBot.define do
  factory :item do
    item_name           {}
    item_info           {}
    category            {}
    sale_status         {}
    shipping_status     {}
    prefecture          {}
    scheduled_delivery  {}
    price
  end
end
