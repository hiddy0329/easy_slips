require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'name、email、password、password_confirmation、postal_code、prefecture_id、city、address、phone_numberの９項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user.building_name = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@を含まない場合は登録できない ' do
        @user.email = 'abc123.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa112'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角かつ英数を両方含む必要があります')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角かつ英数を両方含む必要があります')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａｂｃ111aaa'
        @user.password_confirmation = 'ａｂｃ111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角かつ英数を両方含む必要があります')
      end
      it 'postal_codeが空では保存できないこと' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁-4桁」のフォーマットでなければ保存できないこと' do
        @user.postal_code = '1111-222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角でなければ保存できないこと' do
        @user.postal_code = '１１１-２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeがハイフンなしでは保存できないこと' do
        @user.postal_code = '1112222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では保存できないこと' do
        @user.prefecture_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では保存できないこと' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できないこと' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれている状態では保存できないこと' do
        @user.phone_number = '09-12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角では保存できないこと' do
        @user.phone_number = '０９０１２３４５６７８'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @user.phone_number = '090123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @user.phone_number = '090123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
