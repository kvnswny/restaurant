class Meal < ActiveRecord::Base
  belongs_to :party
  belongs_to :foods
end
