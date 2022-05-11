class Order < ApplicationRecord
  validates :order_number,  uniqueness: true
  validates :note, length: { maximum: 20 }

  belongs_to :slip
end
