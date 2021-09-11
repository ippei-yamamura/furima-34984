class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       with_options presence: true do
         validates :encrypted_password,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
         validates :nick_name
         validates :birth_day
         validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
         validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
         validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
         validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
       end
         has_many :items
         has_many :purchases
end
