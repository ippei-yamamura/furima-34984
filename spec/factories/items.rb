FactoryBot.define do
  factory :item do
    item_name        {'a'}
    price            {'1000'}
    description      {'あ'}
    distination_id   {2}
    status_id        {2}
    category_id      {2}
    shipping_cost_id {2}
    shipping_day_id  {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
