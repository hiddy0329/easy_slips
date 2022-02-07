class Client < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :availability, inclusion: { in: [true, false] }
  end

end
