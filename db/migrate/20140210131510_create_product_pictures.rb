class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.references :product
      t.string :url
      t.text :legend

      t.timestamps
    end
    add_index :product_pictures, :product_id
  end
end
