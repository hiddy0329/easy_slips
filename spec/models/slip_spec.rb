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
    end

    context '作成した伝票を登録できない場合' do
      it 'address_nameが空では登録できない' do
        @slip.address_name = ''
        @slip.valid?
        expect(@slip.errors.full_messages).to include("Address name can't be blank")
      end

      it 'shipping_dateが空では登録できない' do
        @slip.shipping_date = ''
        @slip.valid?
        expect(@slip.errors.full_messages).to include("Shipping date can't be blank")
      end
      
      it 'slip_numberが空では登録できない' do
        @slip.slip_number = ''
        @slip.valid?
        expect(@slip.errors.full_messages).to include("Slip number can't be blank")
      end

      it 'slip_numberが11桁以上では登録できない' do
        @slip.slip_number = 11111111111
        @slip.valid?
        expect(@slip.errors.full_messages).to include("Slip number is too long (maximum is 10 characters)")
      end

      it 'invoice_numberが11桁以上では登録できない' do
        @slip.invoice_number = 11111111111
        @slip.valid?
        expect(@slip.errors.full_messages).to include("Invoice number is too long (maximum is 10 characters)")
      end
    end
  end

end
