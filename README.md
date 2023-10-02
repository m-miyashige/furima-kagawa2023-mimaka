# テーブル設計

## users テーブル

|Column            |Type  |Options    |
|------------------|------|-----------|
|nickname          |string|nill: false|
|email             |string|nill: false|
|encrypted_password|string|nill: false|
|last_name         |string|nill: false|
|first_name        |string|nill: false|
|last_name_kana    |string|nill: false|
|first_name_kana   |string|nill: false|
|birth_date        |date  |nill: false|

### Association

-has_many :items
-has_many :orders

## items テーブル
|Column                  |Type      |Options                       |
|------------------------|----------|------------------------------|
|item_name               |string    |nill: false                   |
|item_info               |text      |nill: false                   |
|item_category           |string    |nill: false                   |
|item_sales_status       |string    |nill: false                   |
|item_shipping_fee_status|string    |nill: false                   |
|item_prefecture         |string    |nill: false                   |
|item_scheduled_delivery |string    |nill: false                   |
|item_price              |integer   |nill: false                   |
|user                    |references|null: false, foreign_key: true|

### Association

-belongs_to :users
-has_one :orders

## orders テーブル
|Column                  |Type      |Options                       |
|------------------------|----------|------------------------------|
|postal_code             |string    |nill: false                   |
|prefecture              |string    |nill: false                   |
|city                    |string    |nill: false                   |
|addresses               |string    |nill: false                   |
|building                |string    |                              |
|phone_number            |string    |nill: false                   |
|user                    |references|null: false, foreign_key: true|
|item                    |references|null: false, foreign_key: true|

### Association

-belongs_to :users
-belongs_to :items