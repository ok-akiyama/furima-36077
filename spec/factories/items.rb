FactoryBot.define do
  factory :item do
    name            { 'おお' }
    category_id     { 2 }
    status_id       { 2 }
    delivery_id     { 2 }
    area_id         { 2 }
    ship_id         { 2 }
    price           { 888 }
    description     { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
