class ProductsController < ActionController::Base
  

  def index
    render :layout => "application"
  end

  def show
    @product = Product.joins(:product_pictures).joins(:product_categories).find(params[:id])
    render :layout => "application"
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
