class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
      with_options presence: true do
         validates :nick_name
         validates :birth_day
         with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full-width characters"} do
           validates :family_name
           validates :first_name
         end
         with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"} do
           validates :family_name_kana
           validates :first_name_kana
         end
      end
         has_many :items
         has_many :purchases
         
end
