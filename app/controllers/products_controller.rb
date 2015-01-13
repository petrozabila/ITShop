class ProductsController < ApplicationController
  
  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by @product
    redirect_to products_path
  end

  def downvote
    @product = Product.find(params[:id])
    @product.downvote_by @product
    redirect_to products_path
  end




  def index
    @rubrics = Rubric.all
    if params[:category].present?
      rubric = Rubric.find(params[:rubric])
      @products = rubric.products
    else
      @products = Product.all.page(params[:page]).per(4)
    end
    
  end

  def add_to_cart
    product_id = params[:id]

    if cookies[:cart].present?
      products = cookies[:cart].split(',')
      products << product_id
      cookies[:cart] = products.join(',')

    else
      cookies[:cart] = product_id
    end

    redirect_to :back
    
  end


  def cartClear
    cookies[:cart] = nil
    redirect_to root_path
  end


def total_price
  products = cookies[:cart].split(',')
  products.to_a.sum { |item| item.total_price }
end


  def new
  	@product = Product.new
    @rubrics = Rubric.all
  end

  def show
  	@product = Product.find(params[:id])
    @rubrics = Rubric.all
    @product.rubric = Rubric.find(params[:rubric_id]) if params[:rubric_id]
  end

  def edit
  	@product = Product.find(params[:id])
  end

def create
  @rubrics = Rubric.all
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

def change_rubric_position
    rubric = Rubric.find(params[:id])
    if params[:move] == 'up'
      rubric.move_higher
    else
      rubric.move_lower
    end
    redirect_to :back
  end



private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
	 params.require(:product).permit(:title, :description, :price, :image, :rubric_id, :remote_image_url)
  end


end
