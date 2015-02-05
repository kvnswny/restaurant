class Meal < ActiveRecord::Base
  has_one :party
  has_many :foods
end
