class Recipe < ActiveRecord::Base
  attr_accessible :description, :ingredients, :preptime, :title, :image, :user_id
  belongs_to :user
  mount_uploader :image, ImageUploader
    
end
