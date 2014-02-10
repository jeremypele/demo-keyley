class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  # attr_accessible :title, :body
end
