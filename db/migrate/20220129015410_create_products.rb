class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string   :item_number,          limit: 10, null: false
      t.string   :color,                           null: false
      t.string   :note,                 limit: 20
      t.boolean  :availability,                    null: false, default: false
      t.timestamps
    end
  end
end
