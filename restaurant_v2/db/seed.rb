require 'pg'
require 'active_record'

db = PG.connect( dbname: 'restaurant_v2' )

init_parties = <<-SQL
  CREATE TABLE parties (
    id          SERIAL          PRIMARY KEY,
    name        TEXT            NOT NULL,
    headcount   INTEGER         NOT NULL,
    tab         INTEGER,
    paid_up     BOOLEAN,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
SQL

init_foods = <<-SQL
  CREATE TABLE foods (
    id          SERIAL          PRIMARY KEY,
    name        TEXT            NOT NULL,
    cuisine     TEXT            NOT NULL,
    veg         BOOLEAN         NOT NULL,
    price       INTEGER         NOT NULL,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
SQL

init_orders = <<-SQL
  CREATE TABLE orders (
    id          SERIAL          PRIMARY KEY,
    party_id    INTEGER         NOT NULL,
    food_id     INTEGER         NOT NULL,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
SQL

init_employees = <<-SQL
  CREATE TABLE employees (
    id          SERIAL          PRIMARY KEY,
    name        TEXT            NOT NULL,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
SQL

db.exec('DROP TABLE IF EXISTS parties')
db.exec('DROP TABLE IF EXISTS foods')
db.exec('DROP TABLE IF EXISTS orders')
db.exec('DROP TABLE IF EXISTS employees')

db.exec(init_parties)
db.exec(init_foods)
db.exec(init_orders)
db.exec(init_employees)
