class Recipe < ActiveRecord::Base
  attr_accessible :description, :ingredients, :preptime, :title
  belongs_to :user
    
end
