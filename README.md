# README
# テーブル設計

## items テーブル

| Column             | Type       | Options                        | 
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| category           | string     | null: false                    |     
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :user

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_read           | string | null: false |
| last_read            | string | null: false |
| year                 | string | null: false |
| month                | string | null: false |
| date                 | string | null: false |

### Association

- has_many :items
- has_many :buyers

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column       | Type   | Options     |
| ----------   | ------ | ----------- |
| postal       | string | null: false |
| prefectures  | string | null: false |
| municipality | string | null: false |
| address      | string | null: false |
| building     | string |             |
| phone        | string | null: false |

### Association

- has_one :buyer