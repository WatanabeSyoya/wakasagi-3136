## アプリケーション名:『ワカサギ釣果情報サイト』


## 概要
釣った魚の情報を投稿して釣りの情報が共有できるアプリです。
<br>開発期間は約2週間です。
[![Image from Gyazo](https://i.gyazo.com/8e05da0d0f8ec658154afb002fe8014a.jpg)](https://gyazo.com/8e05da0d0f8ec658154afb002fe8014a)
## URL
https://wakasagi-3136.herokuapp.com/

## こだわりポイント
- トップページのデザインにこだわりました。
<br>→ヘッダーを２つに分け操作しやすくしました。
<br>→画像が自動でスライドします。

- スマホサイズになるとハンバーガメニューになるなどレスポンシブデザインにも力を入れました。  
- ユーザー詳細画面では投稿された釣果の合計や今までで一番釣った時の情報を取得し、データベース取得の知識も取り入れました。

## テスト用アカウント
* email: s@s
* pw: 111111a

## 目指した課題解決

- 福島県にある桧原湖(ひばらこ)という湖では冬になるとワカサギ釣りを楽しむことができます。
  現状は湖周辺の民宿ごとの釣り情報はありますが、湖全体の情報サイトは存在しません。
  <br>→湖全体の情報を管理共有できるアプリを作成することで解決できます。

- 釣り情報を投稿する際に細かい情報を簡単に投稿したい。
  <br>→投稿する際に選択式(Active Hash)の箇所を増やし文字入力を減らしました。   

## 機能
ユーザー管理(新規登録、ログイン、ログアウト)、投稿、投稿編集、投稿削除、
<br>投稿詳細、ユーザー詳細、並べ替え(ソート)、いいね、コメント、画像スライド、
<br>ページ内移動、Back to Topボタン、ハンバーガーメニュー

### 投稿一覧
[![Image from Gyazo](https://i.gyazo.com/daeaa2bdc7f1a781559d3aa64187da8c.jpg)](https://gyazo.com/daeaa2bdc7f1a781559d3aa64187da8c)
### 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/02091ee88eeea4434c0a9f062aae93b5.png)](https://gyazo.com/02091ee88eeea4434c0a9f062aae93b5)
### ユーザー詳細
[![Image from Gyazo](https://i.gyazo.com/b92a716d58acfb82ebc8fcf76317d0b9.jpg)](https://gyazo.com/b92a716d58acfb82ebc8fcf76317d0b9)
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


