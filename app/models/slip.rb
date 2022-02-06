class Slip < ApplicationRecord
  with_options presence: true do
    validates :address_name
    validates :shipping_date
    validates :slip_number, length: { maximum: 11 }
  end

  belongs_to :user

  has_many :orders, dependent: :destroy 
  accepts_nested_attributes_for :orders, allow_destroy: true
end
