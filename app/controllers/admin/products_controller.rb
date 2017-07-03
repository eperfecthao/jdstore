class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @products = Product.all
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


  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
