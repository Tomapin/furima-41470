# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column             |Type       |Options                        |
|----------------   |---------- |------------------------------ |
|nick_name          |string     |null: false,  |
|email              |string     |null: false, unique:true |
|encrypted_password |string     |null: false, |
|user_surname       |string     |null: false, |
|user_name          |string     |null: false, |
|user_surname_kana  |string     |null: false, |
|user_name_kana     |string     |null: false, |
|barthday           |date       |null: false, |

### Association
- has_many :items
- has_many :records

## itemsテーブル

|Column         |Type               |Options                        |
|-------------  |------------------ |------------------------------ |
|item_name      |string             |null: false, |
|item_text      |text               |null: false, |
|category_id    |integer            |null: false, |
|money          |integer            |null: false, |
|condition_id   |integer            |null: false, |
|burden_id      |integer            |null: false, |
|from_region_id |integer            |null: false, |
|days_to_ship_id|integer            |null: false, |
|user_id        |integer            |mull: false, |

### Association
- belongs_to :user
- has_many   :records

## recordsテーブル

|Column     |Type           |Options                        |
|--------   |-------------- |------------------------------ |
|user_neme  |references     |null: false, |
|item       |references     |foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

|Column       |Type       |Options                        |
|-----------  |---------- |------------------------------ |
|post_number  |string     |null: false, |
|prefecture_id|integer    |null: false, |
|city         |string     |null: false, |
|house_number |string     |null: false, |
|building_name|string     |             |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :record
