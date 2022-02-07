class Order < ApplicationRecord
  validates :note, length: { maximum: 50 }

  belongs_to :slip
end
