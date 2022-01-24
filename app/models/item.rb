class Item < ApplicationRecord
  with_options presence: true do
    validates :item_number
    validates :color
    validates :availability, inclusion: { in: [true, false] }
  end
end
