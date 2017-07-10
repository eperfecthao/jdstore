class CartsController < ApplicationController

  def clean
    current_cart.clean!
    redirect_to :back, alert: "清空购物车成功!"
  end
end
