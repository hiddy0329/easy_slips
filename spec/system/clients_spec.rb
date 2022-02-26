require 'rails_helper'

RSpec.describe "Clients", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @client = FactoryBot.build(:client)
  end
  context '取引先登録ができるとき'do
    it 'ログインしたユーザーは取引先登録できる' do
      # ログインする
      sign_in(@user)
      # 取引先登録ページへのボタンがあることを確認する
      expect(page).to have_content('取引先を登録する')
      # 商品登録ページに移動する
      visit new_client_path
      # フォームに情報を入力する
      fill_in 'form_client_collection_clients_attributes_0_name', with: @client.name
      # チェックボックスにチェックを入れる
      check 'form_client_collection_clients_attributes_0_availability'
      # 送信するとClientモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Client.count }.by(1)
      # 登録済み取引先一覧ページに遷移することを確認する
      expect(current_path).to eq(clients_path)
      # 一覧ページには先ほど登録した内容の取引先が存在することを確認する
      expect(page).to have_content(@client.created_at.strftime('%Y/%m/%d'))
      expect(page).to have_content(@client.name)
      # 「戻る」のボタンがあることを確認する
      expect(page).to have_content('戻る')
      # トップページへ戻る
      find('a[class="btn btn-success"]').click
      expect(current_path).to eq(root_path)
    end
  end
  context '取引先登録ができないとき'do
    it 'ログインしていないと取引先登録ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 取引先登録ページへのボタンがあることを確認する
      expect(page).to have_content('商品を登録する')
      # 取引先登録ページに移動する
      visit new_client_path
      # ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
