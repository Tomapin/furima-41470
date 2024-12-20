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
- has_many :comments

## itemsテーブル

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|itemname |string     |null: false, |
|category |string     |null: false, |
|money    |integer    |null: false, |
|name     |string     |null: false, |

### Association
- belogns_to :users
- has_many   :comments

## commentsテーブル

|Column   |Type       |Options                        |
|------   |---------- |------------------------------ |
|comments |text       |null: false, |


### Association
- belogns_to :users
- belongs_to :items