class Recipe < ActiveRecord::Base

  attr_accessible :description, :ingredients, :preptime, :title, :image
  belongs_to :user
  mount_uploader :image, ImageUploader  

end
