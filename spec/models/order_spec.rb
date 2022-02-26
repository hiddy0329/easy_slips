require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
    
  describe '出荷商品登録' do
    context '出荷商品を登録できない場合' do
      it '伝票が紐づいていなければ登録できない' do
        @order.slip = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Slip must exist")
      end
    end
  end
end
