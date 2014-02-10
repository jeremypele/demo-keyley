class ProductsController < ActionController::Base
  

  def index
  end

  def show
  end


  def get
  	

  	response = Product.all

  	respond_to do |format|
      format.json { render :json => response }
      format.xml  { render :xml  => response }
      format.any  { render :json => response }
    end
  end

end
