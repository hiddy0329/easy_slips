class Order < ApplicationRecord
  with_options presence: true do
    validates :order_number, length: { maximum: 11 }
    validates :color
    validates :count
  end
  belongs_to :slip
end
