# アプリケーション名
KITwords(キットワーズ)

# アプリケーション概要
韓国語に特化した単語帳アプリです。

# URL
https://kit-words.onrender.com

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス: test@test.jp
- パスワード：111aaa

# データベース設計
[![データベース設計](https://i.gyazo.com/004920c6b708af77149fda0d3c5f363a.png)](https://gyazo.com/004920c6b708af77149fda0d3c5f363a)

# 開発環境
- フロントエンド:
HTML / CSS / JavaScript

- フレームワーク:
Ruby on Rails 6.0.0

- データベース:
MySQL / Sequel Pro / PostgreSQL / Render

- その他使用ツール:
GitHub / Visual Studio Code / draw.io

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


## dictionaries テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| vocabulary   | string  | null: false |
| meaning      | string  | null: false |
| user_id      | integer | null: false |

### Association

- belongs to :user