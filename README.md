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

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|nickname |string     |null: false,  |
|email    |string     |null: false, unique:true |
|password |string     |null: false, |
|username |string     |null: false, |
|barthday |integer    |null: false, |

### Association
- has_many :items
- has_many :records
- has_many :shippings

## itemsテーブル

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|itemname |string     |null: false, |
|category |string     |null: false, |
|money    |integer    |null: false, |
|name     |string     |null: false, |

### Association
- belogns_to :users
- has_many   :records
- has_one    :shippings

## recordsテーブル

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|userneme |string     |null: false, |
|records  |string     |null: false, |


### Association
- belogns_to :users
- belongs_to :items

## shippingsテーブル

|Column      |Type       |Options                        |
|----------- |---------- |------------------------------ |
|postnumber  |integer    |null: false, |
|prefecture  |string     |null: false, |
|City        |string     |null: false, |
|housenumber |integer    |null: false, |
|Buildingname|string     |null: false, |
|purchaser   |string     |null: false, |

### Association
- belogns_to :users
- belongs_to :items