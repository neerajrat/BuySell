class Product < ApplicationRecord


  belongs_to :user
  has_one :categories
  
  has_one_attached :image

  paginates_per 20



end
