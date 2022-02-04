class Order < ApplicationRecord
  validates :slip_id, presence: {message: "must exist"}

  belongs_to :slip
end
