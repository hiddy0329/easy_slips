class Slip < ApplicationRecord
  with_options presence: true do
    validates :address_name
    validates :slip_number, length: { maximum: 11 }
    validates :shipping_date
  end
  validates :user_id, presence: {message: "must exist"}
  
  belongs_to :user
  has_many :orders
end
