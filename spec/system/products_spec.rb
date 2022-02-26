require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product)
  end
  context '商品登録ができるとき'do
    it 'ログインしたユーザーは商品登録できる' do
      # ログインする
      sign_in(@user)
      # 商品登録ページへのボタンがあることを確認する
      expect(page).to have_content('商品を登録する')
      # 商品登録ページに移動する
      visit new_product_path
      # フォームに情報を入力する
      fill_in 'form_product_collection_products_attributes_0_item_number', with: @product.item_number
      fill_in 'form_product_collection_products_attributes_0_name', with: @product.name
      fill_in 'form_product_collection_products_attributes_0_color', with: @product.color
      fill_in 'form_product_collection_products_attributes_0_price', with: @product.price
      fill_in 'form_product_collection_products_attributes_0_note', with: @product.note
      # チェックボックスにチェックを入れる
      check 'form_product_collection_products_attributes_0_availability'
      # 送信するとProductモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Product.count }.by(1)
      # 登録済み商品一覧ページに遷移することを確認する
      expect(current_path).to eq(products_path)
      # 一覧ページには先ほど登録した内容の商品が存在することを確認する
      expect(page).to have_content(@product.created_at.strftime('%Y/%m/%d'))
      expect(page).to have_content(@product.item_number)
      expect(page).to have_content(@product.name)
      expect(page).to have_content(@product.color)
      expect(page).to have_content(@product.price)
      expect(page).to have_content(@product.note)
      # 「戻る」のボタンがあることを確認する
      expect(page).to have_content('戻る')
      # トップページへ戻る
      find('a[class="btn btn-success"]').click
      expect(current_path).to eq(root_path)
    end
  end
  context '商品登録ができないとき'do
    it 'ログインしていないと商品登録ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 商品登録ページへのボタンがあることを確認する
      expect(page).to have_content('商品を登録する')
      # 商品登録ページに移動する
      visit new_product_path
      # ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
