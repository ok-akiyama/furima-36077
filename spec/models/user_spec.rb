require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '入力欄に情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'lars_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_readが空だと登録できない' do
        @user.last_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last read can't be blank")
      end
      it 'last_readが全角（カタカナ）以外では登録できない' do
        @user.last_read = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last read is invalid')
      end
      it 'first_readが空では登録できない' do
        @user.first_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First read can't be blank")
      end
      it 'first_readが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_read = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First read is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      describe 'ユーザー新規登録' do
        before do
          @user = FactoryBot.build(:user)
        end
    
        context '内容に問題ない場合' do
          it 'すべての値が正しく入力されていれば保存できること' do
          end
        end
    
        context '内容に問題がある場合' do
          it 'nameが空だと保存できないこと' do
          end
          it 'nameが全角日本語でないと保存できないこと' do
          end
          it 'name_readingが空だと保存できないこと' do
          end
          it 'name_readingが全角カタカナでないと保存できないこと' do
          end
          it 'nicknameが空だと保存できないこと' do
          end
          it 'nicknameが半角でないと保存できないこと' do
          end
        end
      end
    end
  end
end
