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

| Column                | Type       | Options                        |
| ------------------    | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| price                 | integer    | null: false                    |
| item_info             | text       | null: false                    |
| category_id           | integer    | null: false                    |
| sale_status_id        | integer    | null: false                    |
| shipping_status_id    | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |


### Association

- has_one :address
- belongs_to :user


## Addresses テーブル

| postcode         | string        | null: false                     |
| prefecture_id    | integer       |  null: false                    |
| city             | string        | null: false                     |
| block            | string        |  null: false                    |
| building         | string        |                                 |
| phone_number     | string        |  null: false                    |
| order            | references    |  null: false,  foreign_key: true|

### Association

- belongs_to :order