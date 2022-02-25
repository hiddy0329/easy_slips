class CreateSlips < ActiveRecord::Migration[6.0]
  def change
    create_table :slips do |t|
      t.string :address_name, null: false
      t.string :slip_number, null: false, limit: 10
      t.date :shipping_date,  null: false
      t.string :invoice_number, limit: 10 
      t.timestamps
    end
  end
end
