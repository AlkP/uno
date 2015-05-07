class ProductsController < ApplicationController
  before_filter :admin?, except: [:show, :preview, :beer]
  def index
    if params[:products].nil? or params[:products][:category] == 'all'
      @products = Products.all.order('name ASC')
    else
      @products = Products.where('category = ?', params[:products][:category]).order('name ASC')
    end
  end
  def preview
    @preview = Products.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end
  def show
    $menu = params[:id]
    @product_all = Products.where('has_modifiers = ?', true)
    @how_many = [1,3]
    @category = {lunches: 'lunches',
                 sets: 'sets',
                 drinks: 'drinks',
                 hot_snacks: 'hot_snacks',
                 pasta: 'pasta',
                 salads: 'salads',
                 soups: 'soups',
                 dessert: 'dessert',
                 beer: 'beer',
                 drinks: 'drinks',
                 others: 'others',
                 japan_sushi: 'japan_sushi',
                 japan_rolls: 'japan_rolls',
                 japan_hot_rolls: 'japan_hot_rolls',
                 japan_special_roll: 'japan_special_roll',
                 japan_sets: 'japan_sets',
                 japan_others: 'japan_others'}

    if (params[:id]).to_i != 0
      @product = Products.find(params[:id])
    end

    if params[:id] == 'japan_sushi' or params[:id] == 'japan_rolls' or params[:id] == 'japan_hot_rolls' or params[:id] == 'japan_special_roll' or params[:id] == 'japan_sets' or params[:id] == 'japan_others'
      $japan = true
    else
      $japan = false
    end
    @products = Products.where('category = ? and (modifier = ? or modifier is NULL)', $menu, false).order('weight ASC')
    respond_to do |format|
      format.js
      format.html
    end
  end
  def new
    @how_many = [1,3]
    @product = Products.new
    @product_all = Products.where('has_modifiers = ?', true)
  end
  def create
    product = Products.new(products_params)
    if product.save
      redirect_to products_path
    else
      render 'new'
    end
  end
  def update
    @product = Products.find(params[:id])
    @product.update(products_params)
    redirect_to products_path
  end
  def destroy
    product = Products.find(params[:id])
    product.destroy

    redirect_to products_path
  end
  def beer
    respond_to do |format|
      format.js
    end
  end
  private
  def products_params
    params.require(:products).permit(:name,
                                     :modal_help,
                                     :view_products,
                                     :category,
                                     :description,
                                     :short_description,
                                     :how_many,
                                     :name1,
                                     :price1,
                                     :name2,
                                     :price2,
                                     :name3,
                                     :price3,
                                     :rkeeper1,
                                     :rkeeper2,
                                     :rkeeper3,
                                     :has_modifiers,
                                     :modifier,
                                     :modifier_id,
                                     :set,
                                     :weight)
  end
end
