# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_date          | integer | null: false |

### Association

- has_many :items
- has_many :orders
- belongs_to :user_item

## items テーブル

| Column                   | Type       | Options     |
| -----------------------  | ---------- | ----------- |
| name                     | string     | null: false |
| info                     | text       | null: false |
| category_id              | integer    | null: false |
| sales_status_id          | integer    | null: false |
| shipping_fee_status_id   | integer    | null: false |
| prefecture_id            | integer    | null: false |
| scheduled_delivery_id    | integer    | null: false |
| price                    | integer    | null: false |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## user_item テーブル

| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :order

## orders テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecture_id  | string     | null: false |
| city           | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :user_item
