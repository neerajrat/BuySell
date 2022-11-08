class Proposal < ApplicationRecord
  validates_numericality_of :amount, only_numeric: true,presence: true
  belongs_to :product
  belongs_to :user

  scope :with_proposal, ->(current_user_id, productid) { where(user_id: current_user_id, product_id: productid )}
end
