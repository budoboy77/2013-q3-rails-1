class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :entree

  validates :order_id,     presence: true
  validates :entree_id,    presence: true
  validates :chair, presence: true
end
