class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end
  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :distination_id
    validates :status_id
    validates :category_id
    validates :shipping_day_id
    validates :shipping_cost_id
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :distination
  belongs_to :shipping_day
  belongs_to :shipping_cost
end
