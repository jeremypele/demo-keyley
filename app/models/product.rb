class Product < ActiveRecord::Base
  attr_accessible :desc, :is_published, :position, :price, :price_unit, :title, :weight, :weight_unit

  validates :title, presence: true, length: { minimum: 1 }

  attr_accessible :product_categories_attributes
  has_many :product_categories 
  accepts_nested_attributes_for :product_categories, :allow_destroy => true

  attr_accessible :product_pictures_attributes
  has_many :product_pictures 
  accepts_nested_attributes_for :product_pictures, :allow_destroy => true
end
