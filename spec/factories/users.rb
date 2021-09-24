FactoryBot.define do
  factory :user do
    nick_name             {'a'}
    email                 {Faker::Internet.free_email}
    password              {'i12345'}
    password_confirmation {password}
    family_name           {'あ'}
    first_name            {'あ'}
    family_name_kana      {'ア'}
    first_name_kana       {'ア'}
    birth_day             {'1930-01-01'}
  end
end