class SendformsController < ApplicationController
  def show
    if params[:id] == "false"
      $send_order = false
      $warning_address = false
      $warning_pizzeria = false
      $waiting_time = 0
      redirect_to root_path
    else
      @send_form = Sendform.new
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

      respond_to do |format|
        format.js
        format.html
      end
    end
  end
  def create

    # pizza
    unless params[:quantity].nil?
      params[:quantity].each_key do |rnd|
        params[:quantity][rnd].each_key do |pizza_id|
          rkeeper = Rkeeper.where('pizza_id = ? and size_id = ? and dough_id = ? and sauce_id = ?',
                                  pizza_id,
                                  params[:size][rnd],
                                  params[:dough][rnd],
                                  params[:sauce][rnd])
          LineItem.create(cart_id: current_cart.id, rkeeper: rkeeper.first.code, pizza: true, quantity: params[:quantity][rnd][pizza_id])
        end
      end
    end

    # product
    unless params[:name_products].nil?
      params[:name_products].each_key do |rnd|
        params[:quantity_product][rnd].each_key do |product_id|
          product = Products.find(product_id)
          unless params[:modifier][rnd][product_id] == "true"
            case params[:name_products][rnd][product_id]
              when "1"
                LineItem.create(cart_id: current_cart.id, rkeeper: product.rkeeper1, pizza: nil, quantity: params[:quantity_product][rnd][product_id])
              when "2"
                LineItem.create(cart_id: current_cart.id, rkeeper: product.rkeeper2, pizza: nil, quantity: params[:quantity_product][rnd][product_id])
              when "3"
                LineItem.create(cart_id: current_cart.id, rkeeper: product.rkeeper3, pizza: nil, quantity: params[:quantity_product][rnd][product_id])
            end
          else
            flag_set = false
            if params[:set_access]
              if params[:set_access][rnd] == product_id
                flag_set = true
                params[:set][rnd].each_key do |set_product|

                  variant_product = Variant.find(set_product);
                  content = Content.find(params[:set][rnd][set_product])


                  content_product = Products.find(content.idd)
                  product_finish = Products.find(variant_product.products_id)
                  case content.size
                    when 1
                      LineItem.create(cart_id: current_cart.id, rkeeper: product_finish.rkeeper1, pizza: nil, quantity: params[:quantity_product][rnd][product_id], has_modifier: content_product.id)
                    when 2
                      LineItem.create(cart_id: current_cart.id, rkeeper: product_finish.rkeeper2, pizza: nil, quantity: params[:quantity_product][rnd][product_id], has_modifier: content_product.id)
                    when 3
                      LineItem.create(cart_id: current_cart.id, rkeeper: product_finish.rkeeper3, pizza: nil, quantity: params[:quantity_product][rnd][product_id], has_modifier: content_product.id)
                  end
                end
              end
            end
            unless flag_set
              main_product = Products.find(product.modifier_id)
              case params[:name_products][rnd][product_id]
                when "1"
                  LineItem.create(cart_id: current_cart.id, rkeeper: main_product.rkeeper1, pizza: nil, quantity: params[:quantity_product][rnd][product_id], has_modifier: product.id)
                when "2"
                  LineItem.create(cart_id: current_cart.id, rkeeper: main_product.rkeeper2, pizza: nil, quantity: params[:quantity_product][rnd][product_id], has_modifier: product.id)
                when "3"
                  LineItem.create(cart_id: current_cart.id, rkeeper: main_product.rkeeper3, pizza: nil, quantity: params[:quantity_product][rnd][product_id], has_modifier: product.id)
              end
            end
          end
        end
      end
    end

    town = ''
    case params[:sendform][:town]
      when '7800000000000'
        town = "Санкт-Петербург"
      when '7800000300000'
        town = "Колпино"
      when '7800000700000'
        town = "Павловск"
      when '7800000900000'
        town = "Пушкин"
    end
    address = town + "," + params[:sendform][:street] + ", дом:" + params[:sendform][:house]
    new_location = Location.create(address: address)
    pizzeria = pizzaria_in new_location.latitude, new_location.longitude
    qw = podschet current_cart.id, nil, true
    if qw
      @pr     = qw[:pr]
      @amount = qw[:amount]
      @count  = qw[:count]
    else
      @pr     = []
      @amount = 0
      @count  = 0
    end
    if pizzeria
      pizzeria_v = Pizzeria.find(pizzeria)
      puts "Send order."
      puts Time.now()
      puts "Find pizziria:" + pizzeria.to_s
      puts "email: " + pizzeria_v.email
      if pizzeria_v.work
        $send_order = true
        $waiting_time = pizzeria_v.waiting_time
        if pizzeria_v.redirect
          puts "redirect: yes"
          pizzeria_email = Pizzeria.find(pizzeria_v.redirect_email)
          puts "email redirect: " + pizzeria_email.email
          UserMailer.send_xml(pizzeria_email.email,params[:sendform], qw).deliver
        else
          puts "redirect: no"
          UserMailer.send_xml(pizzeria_v.email,params[:sendform], qw).deliver
        end

        LineItem.where(:cart_id => current_cart.id).where(:executed => nil).update_all(executed: true)

        session[:cart_id] = 'terg'
        session[:cookie]  = nil
        session[:price]   = nil
        session[:count]   = nil

      else
        $warning_pizzeria = true
      end
    else
      $warning_address = true
    end
    #UserMailer.send_xml('evgeny_samus@hotmail.com',params[:sendform], qw).deliver
    #UserMailer.send_xml('apasenko@gmail.com',params[:sendform], qw).deliver

    redirect_to root_path
  end
end
