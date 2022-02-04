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
- has_many :slips

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
| user_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :orders

## ordersテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| order_number         | integer    |                                |
| color                | string     |                                |
| count                | integer    |                                |
| note                 | string     |                                |
| slip_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :slip








