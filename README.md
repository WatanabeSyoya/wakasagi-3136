# アプリケーション名:『ワカサギ釣果情報サイト』


## 概要
ワカサギ釣りでの釣った情報を共有出来るアプリ

## URL
https://wakasagi-3136.herokuapp.com/

## 利用方法

## テスト用アカウント
* email: s@s
* pw: 111111a

## 利用方法

## 目指した課題解決

## 洗い出した要件

## 機能




### トップ画面1

### トップ画面2

### トップ画面3


### 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/d3e5dcb1c85fd0d534b020d9579d13ce.gif)](https://gyazo.com/d3e5dcb1c85fd0d534b020d9579d13ce)
## データベース設計

### ER図
[![Image from Gyazo](https://i.gyazo.com/2f2396d8a90d58d9ab06fd6edf5df865.png)](https://gyazo.com/2f2396d8a90d58d9ab06fd6edf5df865)

### テーブル設計
usersテーブル
| Column              | Type    | Options      |
| ------------------- | ------  | -----------  |
| nickname            | string  | null: false  |
| email               | string  | unique: true |
| encrypted_password  | string  | null: false  |
| skill               | string  | null: false  |

Association
- has_many :posts
- has_many :messages
- has_many :likes


postsテーブル
| Column               | Type        | Options            |
| -------------------- | ----------- | ------------------ |
| title                | string      | null: false        |
| post_text            | text        | null: false        |
| fishing_result       | integer     | null: false        |
| place_id             | integer     | null: false        |
| water_depth_id       | integer     | null: false        |
| weather_id           | integer     | null: false        |
| feed_id              | integer     | null: false        |
| user                 | references  | foreign_key: true  |

Association
- belongs_to :user
- has_many :messages
- has_many :likes



messagesテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| text    | text        | null: false        |
| post    | references  | foreign_key: true  |
| user    | references  | foreign_key: true  |

Association
- belongs_to :user
- belongs_to :post



likesテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| post    | references  | foreign_key: true  |
| user    | references  | foreign_key: true  |

Association
- belongs_to :user
- belongs_to :post


