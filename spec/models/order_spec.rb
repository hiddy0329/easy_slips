require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
    
  describe '出荷商品登録' do
    context '出荷商品を登録できる場合' do
      it 'orderのnoteが20文字以下であれば登録できる' do
        @order.note = 'あいうえおかきくけこさしすせそたちつてと'
        expect(@order).to be_valid
      end
    end
  
    context '出荷商品を登録できない場合' do
      it 'orderのnoteが20文字より多い場合登録できない' do
        @order.note = 'あいうえおかきくけこさしすせそたちつてとな'
        @order.valid?
        expect(@order.errors.full_messages).to include("Note is too long (maximum is 20 characters)")
      end

      it '伝票が紐づいていなければ登録できない' do
        @order.slip = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Slip must exist")
      end
    end
  end
end
