class Product < ApplicationRecord
  with_options presence: true do
    validates :item_number, length: { maximum: 11 }
    validates :name, length: { maximum: 50 }
    validates :color
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :availability, inclusion: { in: [true, false] }
  end

  validates :note, length: { maximum: 50 }
end
