class Ingredient < ActiveRecord::Base
  has_many :recipes 
  has_many :meals, :through => :recipes 
end