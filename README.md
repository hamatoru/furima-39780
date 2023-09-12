# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_image         | string     | null: false                    |
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    |
| item_info          | string     | null: false                    |
| item_category      | string     | null: false                    |
| sales_status       | string     | null: false                    |
| shipping_status    | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| scheduled_delivery | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one :address


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |


### Association

- has_one :item
- has_one :address
- belongs_to :user


## Addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     |                                |
| order_prefecture | string     | null: false                    |
| order_city       | string     | null: false                    |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user
- has_one :order