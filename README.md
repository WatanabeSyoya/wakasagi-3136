# アプリケーション名:『ワカサギ釣果情報サイト』


## 概要
釣った魚の情報を投稿して釣りの情報が共有できるアプリです

## URL
https://wakasagi-3136.herokuapp.com/


## テスト用アカウント
* email: s@s
* pw: 111111a

## 機能





### トップページ画面
[![Image from Gyazo](https://i.gyazo.com/6cd4abeadcf657659e2221f6b0adc9b8.gif)](https://gyazo.com/6cd4abeadcf657659e2221f6b0adc9b8)

### 投稿詳細
[![Image from Gyazo](https://i.gyazo.com/3e9d33cc09896954efe043e4b2c44774.gif)](https://gyazo.com/3e9d33cc09896954efe043e4b2c44774)
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


