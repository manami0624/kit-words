# アプリケーション名
**KITwords(キットワーズ)**
<br>
〜K(韓国語で)IT用語を覚える為の単語帳〜

<br>

# アプリケーション概要
韓国語に特化した単語帳アプリです。
マウスオーバーで日本語の意味が表示され、meaningボタンを押すと単語の意味を表示できます。
[![Image from Gyazo](https://i.gyazo.com/f106414e7954f2be75171d3d6fe32038.gif)](https://gyazo.com/f106414e7954f2be75171d3d6fe32038)

<br>

# 本番環境URL
https://kit-words.onrender.com

- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス: test@test.jp
- パスワード：111aaa

<br>

# 機能一覧
①ユーザー管理機能
- ユーザー登録機能（devise）
- ログイン・ログアウト機能
- アカウント削除機能

②投稿機能
- 単語投稿機能（韓国語・日本語・単語の説明）
- 編集機能
- 削除機能
- 検索機能
- ページネーション(kaminari)
- ソート機能（新しい順｜古い順｜ランダム）

③その他
- エラーメッセージ日本語化機能(rails-i18n)


<br>

# 工夫した点
投稿すると、完了画面にモチベーションの上がる名言がランダムで表示されます。

[![Image from Gyazo](https://i.gyazo.com/3de8041da72e61ef9f2fa99be3e46131.png)](https://gyazo.com/3de8041da72e61ef9f2fa99be3e46131)

<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/04f11df2252fd5ed97ddefac86268bc8.png)](https://gyazo.com/04f11df2252fd5ed97ddefac86268bc8)

# 使用技術
- フロントエンド:
HTML / CSS / JavaScript

- フレームワーク:
Ruby on Rails 6.0.0

- データベース:
MySQL / Sequel Pro / PostgreSQL / Render

- テスト: RSpec

- その他使用ツール:
GitHub / Visual Studio Code / draw.io

<br>

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :dictionaries


## dictionaries テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| vocabulary   | string  | null: false |
| japanese     | string  | null: false |
| meaning      | string  |             |
| user_id      | integer | null: false |

### Association

- belongs to :user

<br>

# 今後実装したい機能
- 音声再生機能
- レスポンシブ対応
- できた回数カウント機能
- 投稿のフォルダ分け