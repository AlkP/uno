# coding: UTF-8
# coding: US-ASCII
# encoding: UTF-8
# encoding: US-ASCII
include ApplicationHelper
class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:pizza]
  def call
    # @call = Sendform.new;
    respond_to do |format|
      format.js
    end
  end
  def pizza
    if params[:type] == 'send_call'
      town = Pizzeria.find(params[:town])
      UserMailer.send_call(town.email, params[:name], params[:phone], town.name).deliver
    end
    init_variable_pizzas
    @classification = Classification.all.order('weight ASC')
    $menu = 'pizza'
    @pizzas = Pizza.where('sets is NULL or sets = "f"')

    qw = podschet current_cart.id

    if qw
      @pr     = session[:cookie]
      @amount = session[:price]
      @count  = session[:count]
    else
      @pr     = []
      @amount = 0
      @count  = 0
    end
  end
  def index
    if current_user.nil? || current_user.admin?
      init_variable_pizzas
      @classification = Classification.all.order('weight ASC')
      if $menu == 'pizza'
        # @pizzas = Pizza.where("sets is NULL or sets = 'false'")
        @pizzas = Pizza.where('sets is NULL or sets = "f"')
      else
        #@products = Products.where('category = ?',$menu)
        @products = Products.where('category = ? and modifier = ?',$menu, false).order('weight ASC')
      end

      #vari = {:rkeeper => params[:rkeeper], :pizza => params[:pizza], :product_r_keeper => params[:product_r_keeper]}
      #qw = podschet current_cart.id, vari

      qw = podschet current_cart.id

      if qw
        @pr     = session[:cookie]
        @amount = session[:price]
        @count  = session[:count]
      else
        @pr     = []
        @amount = 0
        @count  = 0
      end
    else
      if current_user.manager?

        @pizzeria = Pizzeria.find(current_user.pizzeria_id)
        a = []
        a += ["10 минут"]
        a += ['30 минут']
        a += ['1 час']
        a += ['2 часов']
        a += ['3 часов']
        @waiting_time = a
      end
    end
  end
end

