class ProductsController < ApplicationController
  #skip_before_action :authenticate_user!
  #skip_after_action :verify_authorized

  def index
    @products = policy_scope(Product)
    authorize @products
  end

  def show

  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(auction_params)
    authorize @auction
    if @product.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    if @product.update(auction_params)
      redirect_to auction_path(@auction)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
  end


private

def auction_params
  params.require(:product).permit(:name, :recommended_retail_price_cents)
end

end
