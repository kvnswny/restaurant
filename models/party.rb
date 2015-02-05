class Party < ActiveRecord::Base
  has_one :meal
  has_many :foods
end
