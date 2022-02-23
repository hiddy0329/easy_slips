class Order < ApplicationRecord
  validates :note, length: { maximum: 20 }

  belongs_to :slip
end
