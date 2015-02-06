class Food < ActiveRecord::Base
  has_many :meals
  has_many :parties, through: :meals
end
