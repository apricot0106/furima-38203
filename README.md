# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false,              |
| family_name        | string | null: false,              |
| first_name_kanji   | string | null: false,              |
| family_name_kanji  | string | null: false,              |
| first_name_kana    | string | null: false,              |
| family_name_kana   | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false,              |
| birth_day          | date   | null: false,              |

### Association
- has_many :items
- has_many :baskets

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false,                   |
| description        | text       | null: false,                   |
| category_id        | integer    | null: false,                   |
| condition_id       | integer    | null: false,                   |
| shipping_charge_id | integer    | null: false,                   |
| ship_from_id       | integer    | null: false,                   |
| preparation_day_id | integer    | null: false,                   |
| price              | integer    | null: false,                   |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :basket

## basketsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| customer_id | integer    | null: false,                   |
| card_id     | integer    | null: false,                   |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinationsテーブル

| Column        | Type    | Options      |
| ------------- | ------- | ------------ |
| post_code     | string  | null: false, |
| ship_from_id  | integer | null: false, |
| city          | string  | null: false, |
| address       | string  | null: false, |
| building_name | string  |              |
| phone_number  | string  | null: false, |

### Association
- belongs_to :basket