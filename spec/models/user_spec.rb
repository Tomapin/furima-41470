require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、user_surnameとuser_name、user_surname_kanaとuser_name_kana、barthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1234aaa'
        @user.password_confirmation = '1234asd'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123aa'
        @user.password_confirmation = '123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
      end
      it 'passwordは数字のみは登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordは全角が含まれると登録はできない' do
        @user.password = 'あaaa111'
        @user.password_confirmation = 'あaaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'user_surnameは空では登録できない' do
        @user.user_surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "User_surname can't be blank"
      end
      it 'user_nameは空では登録できない' do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "User_name can't be blank"
      end
      it 'user_surnameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.user_surname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'User_surname is invalid. Input full-width characters'
      end
      it 'user_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.user_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'User_name is invalid. Input full-width characters'
      end
      it 'user_surname_kanaは空では登録できない' do
        @user.user_surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "User_surname_kana can't be blank"
      end
      it 'user_name_kanaは空では登録できない' do
        @user.user_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "User_name_kana can't be blank"
      end
      it 'user_surname_kanaは全角（カタカナ）でないと登録できない' do
        @user.user_surname_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'User_surname_kana is invalid. Input full-width katakana characters'
      end
      it 'user_name_kanaは全角（カタカナ）でないと登録できない' do
        @user.user_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'User_name_kana is invalid. Input full-width katakana characters'
      end
      it 'barthdayが空では登録できない' do
        @user.barthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Barthday can't be blank"
      end
    end
  end
end
