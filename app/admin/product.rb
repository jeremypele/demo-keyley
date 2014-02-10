ActiveAdmin.register Product do

	form do |f|
 		f.semantic_errors *f.object.errors.keys
 		
      	f.inputs "Produit" do # Product's fields
          	f.input :title, :label => 'Titre'
          	f.input :desc , :label => 'Description'      


          	f.input :price, :label => 'Prix'
          	f.input :price_unit, :label => 'Price unit'
          	# , :as => :select, :collection => [['€', 'euros'], ['$', 'dollars']]
    

          	f.input :weight
          	f.input :weight_unit, :label => 'Weight unit'
          	# , :as => :select, :collection => [['kgs', 'kilos'], ['pds', 'pounds']]
    

          	f.input :is_published, :label => 'Visible', :as => :boolean 
          	f.input :position, :label => 'Position'
          	   
      	end
    
        f.has_many :product_categories, :allow_destroy => true, :heading => 'Categories' do |cf|
          cf.input :category
        end

        f.has_many :product_pictures, :allow_destroy => true, :heading => 'Pictures',:new_record => true do |cf|
           cf.input :url
           cf.input :legend
        end

      	f.actions
  	end

end
