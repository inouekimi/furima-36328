FactoryBot.define do
  factory :user do
    nickname {'yamada'}
    # Faker = ランダム
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {'山田'}
    last_name {'太郎'}
    family_name_kana {'ヤマダ'}
    last_name_kana {'タロウ'}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end