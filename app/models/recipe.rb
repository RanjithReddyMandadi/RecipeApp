class Recipe < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :description, :ingredients, :preptime, :title, :image
  belongs_to :user
  mount_uploader :image, ImageUploader  
=======
  attr_accessible :description, :ingredients, :preptime, :title, :image, :user_id
  belongs_to :user
  mount_uploader :image, ImageUploader
    
>>>>>>> e73e577b0332d6eae79eda0b5205a27ecbb75501
end
