class PizzaController < ApplicationController
  include ApplicationHelper
  before_filter :admin?, except: [:index,:preview]
  def new
    @pizza = Pizza.new
    @classification = Classification.all
    if params[:sets] == "true"
      @sets = true
    else
      @sets = false
    end
  end
  def change_price
    @pizza = Pizza.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end
  def preview
    @preview = Pizza.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end
  def change_rkeeper
    @pizza = Pizza.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end
  def index
    @classification = Classification.all.order('weight ASC')
    $menu = 'pizza'
    $japan = false
    if params[:sets] == "true"
      @pizzas = Pizza.where('sets = "t"')
      @new_pizza = true
    else
      # @pizzas = Pizza.where("sets is NULL or sets = 'false'")
      @pizzas = Pizza.where('sets is NULL or sets = "f"')
      @new_pizza = false
    end
    init_variable_pizzas
    respond_to do |format|
      format.js
      format.html
    end
  end
  def show
    @pizza = Pizza.find(params[:id])
    @classification = Classification.all
  end
  def create
    pizza = Pizza.new(pizzas_params)
    if pizza.save
      redirect_(params[:pizza][:sets])
    else
      render 'new'
    end
  end
  def update
    @classification = Classification.all
    if (params[:type]) && (params[:type][:rkeeper])   # Обработка новых R-Keeper кодов
      Rkeeper.where('pizza_id = ?',params[:id]).destroy_all
      params[:size].each_key do |f|
        Rkeeper.save_pizza( params[:size][f], params[:dough][f], params[:sauce][f], params[:id], params[:code][f] )
      end
      redirect_(Pizza.find(params[:id]).sets)
      # redirect_to pizza_index_path
    else
      @pizza = Pizza.find(params[:id])
      if params[:price]
        Price.where('pizza_id = ?',params[:id]).destroy_all
        params[:price].each_key do |f|
          Price.save_pizza( f, params[:id], params[:price][f] )
        end
        redirect_(@pizza.sets)
        # redirect_to pizza_index_path
      else
        if @pizza.update(pizzas_params)
          redirect_(@pizza.sets)
          # redirect_to pizza_index_path
        else
          render 'show'
        end
      end
    end
  end
  def destroy
    pizza = Pizza.find(params[:id])
    sets = pizza.sets
    pizza.destroy

    redirect_(sets)
  end
  def redirect_(sets)
    if sets == '1' or sets == true
      redirect_to pizza_index_path(sets: true)
    else
      redirect_to pizza_index_path
    end
  end
  private
  def pizzas_params
    params.require(:pizza).permit( :sets,
                                   :name,
                                   :modal_help,
                                   :classification_id,
                                   :view_products,
                                   :description,
                                   :price1,
                                   :price2,
                                   :price3,
                                   :rkeeper1,
                                   :rkeeper2,
                                   :rkeeper3,
                                   :rkeeper4,
                                   :rkeeper5,
                                   :rkeeper6,
                                   :rkeeper7,
                                   :rkeeper8,
                                   :rkeeper9,
                                   :rkeeper10)
  end
end
