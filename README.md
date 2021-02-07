# テーブル設計

## usersテーブル
| Column              | Type    | Options      |
| ------------------- | ------  | -----------  |
| nickname            | string  | null: false  |
| email               | string  | unique: true |
| encrypted_password  | string  | null: false  |
| skill               | string  | null: false  |

### Association
- has_many :posts
- has_many :messages
- has_many :likes


## postsテーブル
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

### Association
- belongs_to :user
- has_many :messages
- has_many :likes



## messagesテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| text    | text        | null: false        |
| post    | references  | foreign_key: true  |
| user    | references  | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :post



##  likesテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| post    | references  | foreign_key: true  |
| user    | references  | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :post
