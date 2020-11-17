# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last-name       | string  | null: false |
| first-name      | string  | null: false |
| last-name-kana  | string  | null: false |
| first-name-kana | string  | null: false |
| birth-date      | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| name                 | string     | null: false |
| info                 | text       | null: false |
| category             | string     | null: false |
| sales-status         | string     | null: false |
| shipping-fee-status  | string     | null: false |
| prefecture           | string     | null: false |
| scheduled-delivery   | string     | null: false |
| price                | integer    | null: false |
| user_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card-number    | integer    | null: false |
| card-exp-month | integer    | null: false |
| card-exp-year  | integer    | null: false |
| card-cvc       | integer    | null: false |
| postal-code    | integer    | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| phone-number   | integer    | null: false |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
