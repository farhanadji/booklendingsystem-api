# Ruby on Rails API
Simple API for book lending system made with Ruby on Rails

### Requirement

------------


This project currently works with:
for MAC OSX
- Homebrew 2.1.9
- Gems 3.0.3
- ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]
- Rails 6.0.0.rc2
- Mysql  Ver 8.0.17 for osx10.14 on x86_64 (Homebrew)
- SequelPro DBMS for MYSQL (optional)
- Postman (optional)

### Installation

------------

install all the requirement above then clone this project with your terminal/console.
```
git clone http://github.com/
```
open the project on your code editor and then create database on your MYSQL.
then, change the value of database.yml file in config folder with your own local setting.
```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: [your username]
  password: [your password]
  host: [your host]
  socket: /tmp/mysql.sock

development:
  <<: *default
  database: [your database name] // default : lendingSystem_development
```
after setting database.yml. you need to migrate new table to your database and run this on your project folder terminal.
```
rails db:migrate
```
if migration is successfull, we need to seed our table with several data.
```
rails db:seed
```
if seeding is successfull, we can run the rails project. to run this project you can run this command on your terminal
```
rails s
```


### Endpoint

------------
**GET** /Index
This endpoint will show all the book data in our book table.
example :
```
{
    "message": "success",
    "total": 2,
    "values": [
        {
            "id": 1,
            "title": "Full Throttle",
            "author": "John hill",
            "price": 10000,
            "availability": true,
            "created_at": "2019-08-10T14:14:20.939Z",
            "updated_at": "2019-08-11T15:19:01.851Z"
        },
        {
            "id": 2,
            "title": "Where the Crawdads Sing",
            "author": "Delia Owens",
            "price": 7000,
            "availability": false,
            "created_at": "2019-08-10T14:14:20.983Z",
            "updated_at": "2019-08-10T14:14:20.983Z"
        }
    ]
}
```

**GET** /available
This endpoint only shows book that only have availability is` true`
example :
```
{
    "message": "success",
    "total": 3,
    "values": [
        {
            "id": 3,
            "title": "The Great Gatsby",
            "author": "F. Scott Fitzgerald",
            "price": 6000,
            "availability": true,
            "created_at": "2019-08-10T14:14:20.992Z",
            "updated_at": "2019-08-10T14:14:20.992Z"
        },
        {
            "id": 5,
            "title": "Great Stories for Children",
            "author": "Ruskin Bond",
            "price": 7000,
            "availability": true,
            "created_at": "2019-08-11T14:06:48.885Z",
            "updated_at": "2019-08-11T14:06:48.885Z"
        },
        {
            "id": 6,
            "title": "The Magic of the Lost Temple",
            "author": "Sudha Murty",
            "price": 4000,
            "availability": true,
            "created_at": "2019-08-11T14:09:15.132Z",
            "updated_at": "2019-08-11T14:38:58.172Z"
        }
    ]
}
```
**GET** /show/`id`
This endpoint only shows selected book by id parameter
example : /show/1
```
{
    "message": "success",
    "values": {
        "id": 1,
        "title": "Full Throttle",
        "author": "John hill",
        "price": 10000,
        "availability": false,
        "created_at": "2019-08-10T14:14:20.939Z",
        "updated_at": "2019-08-11T15:19:01.851Z"
    }
}
```

**POST** /create
This endpoint only receive title, author, price to add new book.
example title:test , author:test and price: 2000
```
{
    "message": "success",
    "values": {
        "id": 8,
        "title": "test",
        "author": "test",
        "price": 2000,
        "availability": true,
        "created_at": "2019-08-12T01:28:08.254Z",
        "updated_at": "2019-08-12T01:28:08.254Z"
    }
}
```
**PUT** /update/`id`
This endpoint is for updating book data and only receive title, author, price.
example : /update/8 -> title : test edit, author: test edit, and price : 3000
```
{
    "message": "success",
    "values": {
        "id": 8,
        "title": "test edit",
        "author": "test edit",
        "price": 3000,
        "availability": true,
        "created_at": "2019-08-12T01:28:08.254Z",
        "updated_at": "2019-08-12T01:31:40.406Z"
    }
}
```

**DELETE** /delete/`id`
This endpoint is for deleting book data
example : /delete/8
```
{
    "message": "book deleted succesfully"
}
```

**PUT** /borrow/`id`
This endpoint is for borrow book and change availability to false and book that only has availability is true that can be borrowed.
example : /borrow/1
```
{
    "message": "Borrow Book Successfully",
    "values": {
        "id": 1,
        "title": "Full Throttle",
        "author": "John hill",
        "price": 10000
    }
}
```
**PUT** /return/`id`
This endpoint is for return book and change availability to true and book that only has availibility is false  that can be returned.
```
{
    "message": "Return Book Successfully",
    "values": {
        "id": 1,
        "title": "Full Throttle",
        "author": "John hill",
        "price": 10000
    }
}
```
