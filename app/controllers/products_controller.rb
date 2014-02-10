class ProductsController < ActionController::Base
  
  before_filter :get_filters, :only => [:index] 
  
  def index
    render :layout => "application"
  end

  def show
    @product = Product.find(params[:id], :joins => [:product_pictures,:product_categories])
    render :layout => "application"
  end

  def get
    logger.debug params

    # conditions = { :is_published => true }
    # conditions['product_categories.category_id'] = { '$in' => params['categories'].split(',').to_a.to_s }

    join_query =  " LEFT OUTER JOIN product_pictures on product_pictures.product_id = products.id "
    join_query += " LEFT OUTER JOIN product_categories ON product_categories.product_id = products.id "
    join_query += " LEFT OUTER JOIN categories ON product_categories.category_id = categories.id "
    join_query += " WHERE products.is_published = true"
    
    join_query += " AND product_categories.category_id IN (#{params['categories']})" unless params['categories'].nil?
    sort_filter = params['sort'].nil? ? "products.position asc" : params['sort'] + " asc"

    response = Product.find(:all, :select => "products.*, product_pictures.*, categories.title as category_title",
                    :joins => join_query, :order => sort_filter)
 
  	respond_to do |format|
      format.json { render :json => response }
      format.xml  { render :xml  => response }
      format.any  { render :json => response }
    end
  end


  private

    def get_filters
      @categorys = Category.all
    end

end
