class CreateSlips < ActiveRecord::Migration[6.0]
  def change
    create_table :slips do |t|
      t.string :address_name, null: false
      t.integer :slip_number, null: false, limit: 4
      t.date :shipping_date,  null: false
      t.integer :invoice_number, limit: 4
      t.timestamps
    end
  end
end
