class VariantsController < ApplicationController
  before_filter :admin?
  def add_dish
    Variant.create(pizza: false, products_id:params[:id])
    redirect_to "/products/#{params[:id]}"
  end
  def add_product
    @piz = params[:idd]
    @products = [{id: 99301991, name: "Пицца"}]
    (Products.where("has_modifiers = false or has_modifiers is NULL").where("category = 'others'")).each do |product|
      @products << {id: product.id, name: product.name}
    end
    respond_to do |format|
      format.js
      format.html
    end
  end
  def create_product
    Content.create(variants_id: params[:idd], idd: params[:product_id], size: params[:size])
    redirect_to "/products/#{params[:id]}"
  end
  def delete_dish
    Variant.find(params[:id]).destroy
    redirect_to "/products/#{params[:idd]}"
  end
  def delete_product
    Content.find(params[:id]).destroy
    redirect_to "/products/#{params[:idd]}"
  end
  private
  def variants_params
    params.require(:variant).permit(:pizza,:products_id)
  end
end