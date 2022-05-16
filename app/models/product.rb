class Product < ApplicationRecord
  with_options presence: true do
    validates :item_number, length: { maximum: 10 }
    validates :color
    validates :note, length: { maximum: 20 }
    validates :availability, inclusion: { in: [true, false] }
  end
end
