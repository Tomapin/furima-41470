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
|user_name          |string     |null: false, |
|barthday           |date       |null: false, |

### Association
- has_many :items
- has_many :records
- has_many :shippings

## itemsテーブル

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|item_name|string     |null: false, |
|category |string     |null: false, |
|money    |integer    |null: false, |
|name     |string     |null: false, |

### Association
- belogns_to :user
- has_many   :records
- has_one    :shipping
- belongs_to :categorygenre

## recordsテーブル

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|user_neme|string     |null: false, |
|records  |string     |null: false, |


### Association
- belogns_to :user
- belongs_to :item

## shippingsテーブル

|Column       |Type       |Options                        |
|-----------  |---------- |------------------------------ |
|post_number  |string     |null: false, |
|prefecture   |string     |null: false, |
|city         |string     |null: false, |
|house_number |string     |null: false, |
|building_name|string     |             |
|purchaser    |string     |null: false, |

### Association
- belogns_to :user
- belongs_to :item

## categorygenresテーブル

|Column      |Type       |Options                        |
|----------- |---------- |------------------------------ |
|id          |name       |null: false, |

### Association
- has_many :items
