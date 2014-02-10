class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  
  attr_accessible :product_id, :category_id
end
