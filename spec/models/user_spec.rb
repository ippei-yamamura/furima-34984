require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe "ユーザー新規登録" do
   context '新規登録できるとき' do
    it 'nick_nameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上だと登録できる' do
      @user.password = "i12345"
      @user.password_confirmation = "i12345"
      expect(@user).to be_valid
    end
   end

   context '新規登録できないとき' do
    it "nick_nameが空だと登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "既に登録されているemailは登録することができない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "@が含まれていないemailは登録することができない" do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "passwordは半角英数字を混合させないと登録できない" do
      @user.password = 'z１２３４５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordは半角英字のみでは登録することができない" do
      @user.password = 'iiiiii'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordは半角数字のみでは登録することができない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空だと登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "family_nameが全角でないと登録できない" do
      @user.family_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name Full-width characters")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが全角でないと登録できない" do
      @user.first_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "family_name_kanaが全角カナでないと登録できない" do
      @user.family_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが全角カナでないと登録できない" do
      @user.first_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it "birth_dayが空だと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
   end
  end
end
