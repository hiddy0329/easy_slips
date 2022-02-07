class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.string :color
      t.integer :count
      t.string :note, limit: 50
      t.references :slip, null: false, foreign_key: true
      t.timestamps
    end
  end
end