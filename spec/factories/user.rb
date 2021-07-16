FactoryBot.define do
  factory :user do
    nickname              { '全角'}
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_read             { 'ヤマダ' }
    first_read            { 'タロウ' }
    birthday              { '19300101' }
  end
end
