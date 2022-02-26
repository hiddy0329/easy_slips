require 'rails_helper'

RSpec.describe "Slips", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @client = FactoryBot.create(:client)
    @slip = FactoryBot.build(:slip)
    @order = FactoryBot.build(:order)
  end
  context '伝票作成ができるとき'do
    it 'ログインしたユーザーは伝票作成できる' do
      # ログインする
      sign_in(@user)
      # 伝票作成ページへのボタンがあることを確認する
      expect(page).to have_content('伝票を作成する')
      # 伝票作成ページに移動する
      visit new_slip_path
      # フォームに情報を入力する
      select @client.name, from: "slip_address_name"
      fill_in 'slip_shipping_date', with: @slip.shipping_date
      fill_in 'slip_slip_number', with: @slip.slip_number
      select @product.item_number, from: "slip_orders_attributes_0_order_number"
      select @product.color, from: "slip_orders_attributes_0_color"
      fill_in 'slip_orders_attributes_0_count', with: @order.count
      fill_in 'slip_orders_attributes_0_note', with: @order.note
      # 送信するとSlipモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Slip.count }.by(1)
      # 伝票作成完了ページに遷移することを確認する
      expect(current_path).to eq(slips_path)
      # 「トップへ戻る」のボタンがあることを確認する
      expect(page).to have_content('トップへ戻る')
      # トップページへ戻る
      find('a[class="btn btn-primary"]').click
      expect(current_path).to eq(root_path)
      # 作成済み伝票一覧ページへのボタンがあることを確認する
      expect(page).to have_content('作成済み伝票を確認する')
      # 一覧ページに移動する
      visit slips_path
      # 一覧ページには先ほど作成した内容の伝票が存在することを確認する
      expect(page).to have_content(@slip.slip_number)
      expect(page).to have_content(@client.name)
      expect(page).to have_content(@slip.shipping_date)
    end
  end
  context '伝票作成ができないとき'do
    it 'ログインしていないと伝票作成ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 伝票作成ページへのボタンがあることを確認する
      expect(page).to have_content('伝票を作成する')
      # 伝票作成ページに移動する
      visit new_slip_path
      # ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
