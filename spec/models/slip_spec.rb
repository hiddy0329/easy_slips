require 'rails_helper'

RSpec.describe Slip, type: :model do
  before do
    @slip = FactoryBot.build(:slip)
    10.times do
      @order = @slip.orders.build
    end
  end
  
  describe '伝票作成' do
    context '作成した伝票を登録できる場合' do
      it 'address_name, shipping_date, slip_number, invoice_numberの4項目が存在すれば登録できる' do
        expect(@slip).to be_valid
      end

      it 'slip_numberが10桁以下であれば登録できる' do
        @slip.slip_number = 1111111111
        expect(@slip).to be_valid
      end

      it 'invoice_numberが無くても登録できる' do
        @slip.invoice_number = ''
        expect(@slip).to be_valid
      end

      it 'invoice_numberが10桁以下であれば登録できる' do
        @slip.invoice_number = 1111111111
        expect(@slip).to be_valid
      end

      it 'orderのnoteが20文字以下であれば登録できる' do
        @order.note = 'あいうえおかきくけこさしすせそたちつてと'
        expect(@slip).to be_valid
      end
    end

    context '作成した伝票を登録できない場合' do
      it 'address_nameが空では登録できない' do
        @slip.address_name = ''
        @slip.valid?
        expect(@slip.errors.full_messages).to include("出荷先を入力してください")
      end

      it 'shipping_dateが空では登録できない' do
        @slip.shipping_date = ''
        @slip.valid?
        expect(@slip.errors.full_messages).to include("出荷日を入力してください")
      end
      
      it 'slip_numberが空では登録できない' do
        @slip.slip_number = ''
        @slip.valid?
        expect(@slip.errors.full_messages).to include("伝票番号を入力してください")
      end

      it 'slip_numberが11桁以上では登録できない' do
        @slip.slip_number = 11111111111
        @slip.valid?
        expect(@slip.errors.full_messages).to include("伝票番号は10文字以内で入力してください")
      end

      it 'invoice_numberが11桁以上では登録できない' do
        @slip.invoice_number = 11111111111
        @slip.valid?
        expect(@slip.errors.full_messages).to include("送り状ナンバーは10文字以内で入力してください")
      end

      it 'orderのnoteが20文字より多い場合登録できない' do
        @order.note = 'あいうえおかきくけこさしすせそたちつてとな'
        @slip.valid?
        expect(@slip.errors.full_messages).to include("備考は20文字以内で入力してください")
      end
    end
  end

end
