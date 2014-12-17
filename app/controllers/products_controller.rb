class ProductsController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 7)
    @rubrics = Rubric.all

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


private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
	 params.require(:product).permit(:title, :drscription, :price, :image_url, :rubric_id)
  end


end
