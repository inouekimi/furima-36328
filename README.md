# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| family_name        | string  | null: false |
| last_name          | string  | null: false |
| nickname           | string  | null: false |
| encrypted_password | string  | null: false |
| email              | string  | null: false |
| birthday           | integer | null: false |


### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | string     | null: false                    |
| price            | integer    | null: false                    |
| shipping_charges | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| explanation      | text       | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to          | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- belongs_to :purchase

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_address テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | integer    | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| address        | integer    | null: false |
| building_name  | string     | null: false |
| telephone      | integer    | null: false |

### Association
- belongs_to :purchase
