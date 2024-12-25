FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'password123' }
    password_confirmation { password }
    user_surname            { '浅野' }
    user_name             { '太郎' }
    user_surname_kana       { 'アサノ' }
    user_name_kana        { 'タロウ' }
    barthday            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
