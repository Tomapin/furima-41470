FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
