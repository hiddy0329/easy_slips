class Slip < ApplicationRecord
  with_options presence: true do
    validates :address_name
    validates :shipping_date
    validates :slip_number, length: { maximum: 10 }
  end
  validates :invoice_number, length: { maximum: 10 }

  has_many :orders, dependent: :destroy 
  accepts_nested_attributes_for :orders, allow_destroy: true

  def self.search(search)
    if search != ""
      Slip.where('slip_number LIKE(?)', "%#{search}%")
    else
      Slip.all
    end
  end
end