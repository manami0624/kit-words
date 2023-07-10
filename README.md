# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :words


## words テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| korean   | string  | null: false |
| japanese | string  | null: false |
| user_id  | integer | null: false |

### Association

- belongs to :user