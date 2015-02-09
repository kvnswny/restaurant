#\ -p 3000

require 'bundler'
Bundler.require :default

set :database, {
  adapter: "postgresql", database: "restaurant_v2", host: "localhost", port: 5432
}

require './app'
run Restaurant
