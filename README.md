## アプリケーション名:『ワカサギ釣果情報サイト』


## 概要
釣った魚の情報を投稿して釣りの情報が共有できるアプリです
[![Image from Gyazo](https://i.gyazo.com/8e05da0d0f8ec658154afb002fe8014a.jpg)](https://gyazo.com/8e05da0d0f8ec658154afb002fe8014a)
## URL
https://wakasagi-3136.herokuapp.com/


## テスト用アカウント
* email: s@s
* pw: 111111a

## 目指した課題解決

- 福島県にある桧原湖(ひばらこ)という湖では冬になるとワカサギ釣りを楽しむことができる。
  現状、湖の周りに何箇所かある民宿ごとの釣り情報はあるが、湖全体の情報サイトは存在しない。
  <br>→湖全体の情報を管理共有する

- 釣り情報を投稿する際に細かい情報を簡単に投稿したい。
  <br>→投稿する際に選択式(Active Hash)の箇所を増やし文字入力を減らした。   

## 機能
ユーザー管理、投稿、投稿編集、投稿削除、投稿詳細、ユーザー詳細、並べ替え(ソート)、
いいね、コメント、画像スライド、
ページ内移動、Back to Topボタン、
ハンバーガーメニュー
### 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/3e9d33cc09896954efe043e4b2c44774.gif)](https://gyazo.com/3e9d33cc09896954efe043e4b2c44774)


## 使用技術
- フレームワーク：Rails6.0.3
- フロント：HTML、CSS、JavaScript（jQuery）
- サーバーサイド言語：Ruby2.6.5
- データベース：MySQL
- テストフレームワーク：RSpec
- コードチェック：RuboCop
- サーバー：Puma Nginx
- バージョン管理：GitHub
- 開発環境：localhost
- デプロイ環境：Heroku,AWS(S3)
- ユーザー管理：devise
- コメント機能：Action Cable
- 画像投稿： ActiveStorage
- 使用マシン：Mac Big Sur(11.1)
- 開発期間（約 2 週間）



## データベース設計

### ER図
[![Image from Gyazo](https://i.gyazo.com/15766ef3ce239da1fee234a75e2b4724.png)](https://gyazo.com/15766ef3ce239da1fee234a75e2b4724)

### テーブル設計
#### usersテーブル
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



#### postsテーブル
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



#### messagesテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| text    | text        | null: false        |
| post    | references  | foreign_key: true  |
| user    | references  | foreign_key: true  |

Association
- belongs_to :user
- belongs_to :post



#### likesテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| post    | references  | foreign_key: true  |
| user    | references  | foreign_key: true  |

Association
- belongs_to :user
- belongs_to :post


