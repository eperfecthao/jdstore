class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :move_up, :move_down]
  before_action :require_is_admin

  layout "admin"

  def index
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "新增商品成功"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "更新商品成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, warning: "删除商品成功"
  end

  def move_up
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product.move_lower
    redirect_to :back
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
