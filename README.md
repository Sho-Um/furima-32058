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

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| name                 | string     | null: false |
| info                 | text       | null: false |
| category             | integer    | null: false |
| sales_status         | integer    | null: false |
| shipping_fee_status  | integer    | null: false |
| prefecture           | integer    | null: false |
| scheduled_delivery   | integer    | null: false |
| price                | integer    | null: false |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | integer    | null: false |
| card_exp_month | integer    | null: false |
| card_exp_year  | integer    | null: false |
| card_cvc       | integer    | null: false |
| postal_code    | integer    | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| phone_number   | integer    | null: false |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
