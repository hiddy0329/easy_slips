class CreateSlips < ActiveRecord::Migration[6.0]
  def change
    create_table :slips do |t|
      t.string :address_name, null: false
      t.integer :slip_number, null: false, limit: 4 #limitは桁数ではなく、バイト数指定(4は11桁)
      t.date :shipping_date,  null: false
      t.integer :invoice_number, limit: 4 #limitは桁数ではなく、バイト数指定(4は11桁)
      t.timestamps
    end
  end
end
