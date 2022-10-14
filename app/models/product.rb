class Product < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image
  before_save :status_value


  def status_value
    self.status = "pending"
  end

end
