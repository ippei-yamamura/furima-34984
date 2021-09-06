# DB 設計

## users tabel
|Column               |Type               |Options                    |
|---------------------|-------------------|---------------------------|
|nick_name            |string             |null:false                 |
|email                |string             |null:false,unique: true    |
|encrypted_password   |string             |null:false                 |
|birth_day            |date               |null:false                 |
|family_name          |string             |null:false                 |
|first_name           |string             |null:false                 |
|familt_name_kana     |string             |null:false                 |
|first_name_kana      |string             |null:false                 |

### Association
* has_many :items
* has_many :purchases


## items tabel

|Column               |Type               |Options                    |
|---------------------|-------------------|---------------------------|
|item_name            |string             |null:false                 |
|price                |integer            |null:false                 |
|description          |string             |null:false                 |
|distination          |integer            |null:false,forein_key: true|
|status               |integer            |null:false,forein_key: true|
|category             |integer            |null:false,forein_key: true|
|shipping_day         |integer            |null:false,forein_key: true|
|shipping_cost        |integer            |null:false,forein_key: true|
|user                 |integer            |null:false,forein_key: true|

### Association
* belongs_to :user
* has_one :purchase


## purchases table

|Column               |Type               |Options                    |
|---------------------|-------------------|---------------------------|
|user                 |integer            |null:false,forein_key: true|
|item                 |integer            |null:false,forein_key: true|

### Association
* belongs_to :user
* belongs_to :item
* has_one :distination


## distinations table

|Column               |Type               |Options                    |
|---------------------|-------------------|---------------------------|
|post_code            |string             |null:false                 |
|prefecture           |string             |null:false                 |
|city                 |string             |null:false                 |
|address              |string             |null:false                 |
|bulding_name         |string             |                           |
|phone_number         |string             |null:false                 |
|purchase_id          |integer            |null:false,forein_key: true|

### Association
* belongs_to :purchase

