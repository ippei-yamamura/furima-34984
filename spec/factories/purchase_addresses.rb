FactoryBot.define do
  factory :purchase_address do
    post_code       {'123-4567'}
    distination_id  {2}
    city            {'あ'}
    house_number    {'あ'}
    phone_number    {'00000000000'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
