class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :proposals
  has_one_attached :image
  paginates_per 20

  validates :name, presence: true
  validates :detail, presence: true
  validates :image, presence: true
  validates_numericality_of :price, only_numeric: true,presence: true


  def self.search(search)
    where("lower(product.name) LIKE :search ", search: "%#{search.downcase}%").uniq
  end
end
