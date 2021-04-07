FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    nickname { Faker::Name.initials }
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    last_name_kana { gimei.last.katakana }
    first_name_kana { gimei.first.katakana }
    birth_date { Faker::Date.in_date_period }
  end
end
