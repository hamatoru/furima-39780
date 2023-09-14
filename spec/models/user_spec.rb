require 'rails_helper'
RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do


  context 'ユーザー新規登録できるとき' do
    it '全ての項目が入力されていると登録できる' do
    expect(@user).to be_valid
  end
end

  context 'ユーザー新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "重複したemailの場合は登録ができない" do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'mail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank") 
    end
    it "passwordが5文字以下では登録ができない" do
      @user.password = '00000'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end
    it "passwordが確認用と一致しない場合は登録ができない" do
      @user.password = 'pa1ss2wo3rd4'
      @user.password_confirmation = 'pass12word34'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it "passwordが英字のみでは登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password ='111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end
    it "passwordが全角文字では登録できない" do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "last_nameが空では登録ができない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
    it "last_name_kanaが空では登録ができない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
    end
    it "first_nameが空では登録ができない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it "first_name_kanaが空では登録ができない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it "birthdayが空では登録ができない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end
    it "last_name_kanaにカナ以外が含まれていると登録ができない" do
      @user.last_name_kana = '田ナカ'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana is invalid. Input full-width katakana characters")
    end
    it "first_name_kanaにカナ以外が含まれていると登録ができない" do
      @user.first_name_kana = 'タろう'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana is invalid. Input full-width katakana characters")
    end
  end
end
end