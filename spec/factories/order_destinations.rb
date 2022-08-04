FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    ship_from_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end