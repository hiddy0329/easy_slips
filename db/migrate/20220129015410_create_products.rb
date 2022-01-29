class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer  :item_number,          limit: 4, null: false
      t.string   :name,                 limit: 50, null: false
      t.string   :color,                           null: false
      t.integer  :price,                           null: false
      t.string   :note,                 limit: 50
      t.boolean  :availability,                    null: false, default: false
      t.timestamps
    end
  end
end
