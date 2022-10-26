class Product < ApplicationRecord
  belongs_to :user
  has_one :categories
  
  has_one_attached :image
  before_save :status_value
  
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }

  def status_value
    self.status = "pending"
  end

end
