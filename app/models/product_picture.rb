class ProductPicture < ActiveRecord::Base
  belongs_to :product
  attr_accessible :url, :legend, :product_id
end
