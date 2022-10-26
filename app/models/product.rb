class Product < ApplicationRecord
  belongs_to :user
  has_one :categories
  
  has_one_attached :image
  before_save :status_value
  paginates_per 20
  def status_value
    self.status = "pending"
  end

end
