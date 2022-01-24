class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :item_number, null:false
      t.string :color,        null:false
      t.timestamps
    end
  end
end
