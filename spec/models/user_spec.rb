require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての情報を入れると登録できる' do
        @user
        expect(@user).to be_valid
      end
      it 'パスワードは6文字以上であれば登録できる' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'メールアドレスが空だと登録できない' do
      end
      it 'メールアドレスは@がないと登録できない' do
      end
      it 'パスワードが空だと登録できない' do
      end
      it 'パスワードは5文字以下であれば登録できない' do
      end
      it 'パスワードとパスワード（確認用）が不一致では登録できない' do
      end
      it 'パスワードは英語のみでは登録できない' do
      end
      it 'パスワードは数字のみでは登録できない' do
      end
      it 'パスワードは全角では登録できない' do
      end
      it '重複したemailが存在する場合登録できない' do
      end
    end
  end
end
