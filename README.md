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
- has_many :clients
- has_many :slips

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture

## itemsテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| item_number          | integer    | null: false                    |
| color                | string     | null: false                    |

## clientsテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## slipsテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| slip_number          | integer    | null: false                    |
| shipping_date        | date       | null: false                    |
| invoice_number       | integer     | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :orders
- has_one :address

## ordersテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| order_number         | integer    | null: false                    |
| color                | string     | null: false                    |
| count                | integer    | null: false                    |
| slip_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :slip

## addressesテーブル
| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| slip_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :slip








