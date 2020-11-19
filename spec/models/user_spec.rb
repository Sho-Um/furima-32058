require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation, last_nameとfirst_name, last_name_kanaとfirst_name_kana, birth_dateが存在すれば登録できる' do
        @user
      end
      it 'passwordが6文字以上で、passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在すると登録できないこと' do
        @user.save
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it '@を含まないemailだと登録できないこと' do
        @user.email = 'iii111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password には英字と数字の両方を含めて設定してください', "Password confirmation doesn't match Password")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordに半角英字が含まれていないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordに半角数字が含まれていないと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードとパスワード(確認用)の値が一致していないと登録できない' do
        @user.password = '1abcde'
        @user.password_confirmation = '1abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameがない場合は登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end

      it 'first_nameがない場合は登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end

      it 'last_nameは全角(漢字・ひらがな・カタカナ)での入力でないと登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'first_nameは全角(漢字・ひらがな・カタカナ)での入力でないと登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'last_name_kanaがない場合は登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角カタカナを使用してください')
      end

      it 'first_name_kanaがない場合は登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角カタカナを使用してください')
      end

      it 'last_name_kanaは全角カタカナでの入力でないと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナを使用してください')
      end

      it 'first_name_kanaは全角カタカナでの入力でないと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナを使用してください')
      end

      it 'birth_dateがない場合は登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
