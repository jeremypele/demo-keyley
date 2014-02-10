class Product < ActiveRecord::Base
  attr_accessible :desc, :is_published, :position, :price, :price_unit, :title, :weight, :weight_unit
end
