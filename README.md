# テーブル設計

##users テーブル

| Column             | Type   | Options          |
| ------------------ | ------ | ---------------- |
| name               | string | NOT NULL         |
| email              | string | NOT NULL, UNIQUE |
| encrypted_password | string | NOT NULL         |
| profile            | text   | NOT NULL         |
| occupation         | text   | NOT NULL         |
| position           | text   | NOT NULL         |

### Association

- has_many :prototypes

##prototypes テーブル

| Column     | Type       | Options                     |
| ---------- | ---------- | --------------------------- |
| title      | string     | NOT NULL                    |
| catch_copy | text       | NOT NULL                    |
| concept    | text       | NOT NULL                    |
| user       | references | NOT NULL, foreign_key: true |

### Association

- belongs_to :user

##comments テーブル

| Column    | Type       | Options                     |
| --------- | ---------- | --------------------------- |
| content   | text       | NOT NULL                    |
| prototype | references | NOT NULL, foreign_key: true |
| user      | references | NOT NULL, foreign_key: true |

- belongs_to :prototype
- belongs_to :user
