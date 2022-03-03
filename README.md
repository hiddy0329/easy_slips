# アプリケーション名
【Easy Slips】
- 伝票作成を効率的に行うことができるアプリケーション

# アプリケーション概要
- アカウントを作成する
- 商品を登録する
- 取引先を登録する
- 伝票を作成し、PDF出力する

# URL
[Easy Slips -Heroku](https://easyslips.herokuapp.com/)

# テスト用アカウント
ID:admin
PW:2222

# 利用方法
1. トップページ上部の「新規登録ボタン」から新規登録する
2. トップページの「商品登録ボタン」から商品登録ページへ遷移し、商品を一括で登録する
3. トップページの「取引先登録ボタン」から取引先登録ページへ遷移し、取引先を一括で登録する
4. トップページの「伝票作成ボタン」から伝票作成ページへ遷移し、伝票を作成する(出荷先は「登録済み取引先」から、出荷商品は「登録済み商品」から選ぶことができる)
5. トップページの「作成済み伝票一覧ボタン」から一覧ページへ遷移し、それぞれの伝票の詳細ページからPDF出力をする
6. 伝票は個別に「削除」、「編集」ができる
7. 商品と取引先も個別に削除ができる

# 目指した課題解決

## ペルソナ
- 50代女性、一般事務職として働いている

## 解決したい課題
- 手作業で行っている伝票作成の効率化

# 実装した機能
- ユーザー管理機能(新規登録・ログイン)
- 商品登録機能(チェックボックスにチェックを入れた商品のみを一括で登録できる)
- 登録済み商品一覧表示機能(個別に削除も可能)
- 取引先登録機能(チェックボックスにチェックを入れた取引先のみを一括で登録できる)
- 登録済み取引先一覧表示機能(個別に削除も可能)
- 伝票作成機能(出荷先と出荷商品はそれぞれ登録済みの項目から選ぶことができる。出荷商品は10件まで入力可能。)
- 作成済み伝票一覧表示機能
- 伝票詳細表示機能
- 伝票編集機能
- 伝票削除機能
- 伝票出力機能(伝票詳細ページから個別にPDF出力できる)
- トップページ表示機能
- エラーメッセージの日本語化
- Basic認証の導入

# 実装予定機能
- 伝票検索機能
- チャット機能

# データベース設計

## usersテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |
| postal_code          | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | string     | null: false                    |

### Association
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture

## productsテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| item_number          | integer    | null: false                    |
| name                 | string     | null: false                    |
| color                | string     | null: false                    |
| price                | integer    | null: false                    |
| note                 | string     | null: false                    |
| availability         | boolean    | null: false                    |

## clientsテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| availability         | boolean    | null: false                    |

## slipsテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| address_name         | string     | null: false                    |
| slip_number          | integer    | null: false                    |
| shipping_date        | date       | null: false                    |
| invoice_number       | integer    |                                |

### Association
- has_many :orders
- accepts_nested_attributes_for :orders, allow_destroy: true

## ordersテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| order_number         | integer    | null: false                    |
| color                | string     | null: false                    |
| count                | integer    | null: false                    |
| note                 | string     | null: false                    |
| slip_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :slip

![ER図](pablic/ER図.png)

# 備考・参考にしたサイト
フロントサイド
- Bootstrap5公式ページ
  (https://getbootstrap.jp/)
- Bootstrapの導入レッスン
  (https://skillhub.jp/courses/168)
- Adobe Creative Cloud Express公式ページ
  (https://www.adobe.com/jp/express/create/logo)

サーバーサイド
- Thinreports公式ページ
  (https://www.thinreports.org/)
- Qiita(フォームからの一括登録機能の実装について)
  (https://qiita.com/kinop1987/items/63586892116446043365)
- Qiita(一つのフォームから複数のテーブルへの保存について)
  (https://qiita.com/koki_73/items/bc4ca80ab43e84d9704f)











