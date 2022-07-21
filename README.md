# テーブル設計

## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| first_name         | string   | null: false,              |
| family_name        | string   | null: false,              |
| first_name_kana    | string   | null: false,              |
| family_name_kana   | string   | null: false,              |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false,              |
| birth_day          | date     | null: false,              |

### Association
- has_many :items
- has_many :baskets

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false,                   |
| description     | text       | null: false,                   |
| category        | integer    | null: false,                   |
| condition       | integer    | null: false,                   |
| shipping_charge | integer    | null: false,                   |
| ship_from       | integer    | null: false,                   |
| preparation_day | integer    | null: false,                   |
| price           | string     | null: false,                   |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :basket

## basketsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false,                   |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinationsテーブル

| Column        | Type   | Options      |
| ------------- | ------ | ------------ |
| post_code     | string | null: false, |
| prefecture    | string | null: false, |
| city          | string | null: false, |
| address       | string | null: false, |
| building_name | string | null: false, |
| phone_number  | string | null: false, |

### Association
- belongs_to :basket