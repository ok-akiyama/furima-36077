FactoryBot.define do
  factory :order_address do
    postal { '123-4567' }
    area_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { "08088888888" }
    token {"tok_0000000000000000000000000000"}
  end
end
