require 'pg'
require 'active_record'

# ActiveRecord::Base.establish_connection(
#   adapter: :postgresql,
#   database: :restaurant,
#   host: :localhost,
#   port: 5432
# )

db = PG.connect( dbname: 'restaurant' )

init_parties = <<-SQL
  CREATE TABLE parties (
    id          SERIAL        PRIMARY KEY,
    name        TEXT          NOT NULL,
    count       INTEGER       NOT NULL,
    tab         INTEGER,
    paid_up     BOOLEAN,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
  SQL

init_foods = <<-SQL
  CREATE TABLE foods (
    id          SERIAL        PRIMARY KEY,
    name        TEXT          NOT NULL,
    cuisine     TEXT          NOT NULL,
    veg         BOOLEAN       NOT NULL,
    price       INTEGER       NOT NULL,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
  SQL

init_meals = <<-SQL
  CREATE TABLE meals (
    id          SERIAL        PRIMARY KEY,
    party_id    INTEGER       NOT NULL,
    food_id     INTEGER       NOT NULL,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP
  )
  SQL



db.exec('DROP TABLE IF EXISTS parties')
db.exec('DROP TABLE IF EXISTS foods')
db.exec('DROP TABLE IF EXISTS meals')

db.exec(init_parties)
db.exec(init_foods)
db.exec(init_meals)

db.exec('DELETE FROM parties')
db.exec('DELETE FROM foods')
db.exec('DELETE FROM meals')
