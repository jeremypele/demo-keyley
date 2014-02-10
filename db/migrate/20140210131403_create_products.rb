class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.float :price
      t.string :price_unit
      t.float :weight
      t.string :weight_unit
      t.integer :position
      t.boolean :is_published

      t.timestamps
    end
  end
end
