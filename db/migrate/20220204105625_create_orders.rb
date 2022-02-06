class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_number, null: false
      t.string :color, null: false
      t.integer :count, null: false
      t.references :slip, null: false, foreign_key: true
      t.timestamps
    end
  end
end
