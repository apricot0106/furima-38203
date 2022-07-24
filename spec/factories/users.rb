FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '陸太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'リクタロウ' }
    birth_day { Faker::Date.birthday }
  end
end
