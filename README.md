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
|price                |string             |null:false                 |
|destination          |string             |null:false                 |
|status               |string             |null:false                 |
|category             |string             |null:false                 |
|shipping_day         |string             |null:false                 |
|shipping_cost        |string             |null:false                 |
|item_image           |string             |null:false                 |
|user_id              |integer            |null:false,forein_key: true|
|item_id              |integer            |null:false,forein_key: true|

### Association
* has_many :users
* has_one :purchases


## purchases table

|Column               |Type               |Options                    |
|---------------------|-------------------|---------------------------|
|family_name          |string             |null:false                 |
|first_name           |string             |null:false                 |
|family_name_kana     |string             |null:false                 |
|first_name_kana      |string             |null:false                 |
|item_name            |string             |null:false                 |
|item_id              |integer            |null:false,forein_key: true|

### Association
* belongs_to :user
* belongs_to :item
* has_one :distinations


## distinations table

|Column               |Type               |Options                    |
|---------------------|-------------------|---------------------------|
|post_code            |string             |null:false                 |
|prefecture           |string             |null:false                 |
|city                 |string             |null:false                 |
|address              |string             |null:false                 |
|bulding_name         |string             |null:false                 |
|phone_number         |string             |null:false                 |
|purchase_id          |integer            |null:false,forein_key: true|

### Association
* belongs_to :purchases

