class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  $menu = 'pizza'

  $send_order = false
  $warning_address = false
  $warning_pizzeria = false
  $waiting_time = 0

  $japan = false

  def podschet cart_id, vari = nil, create_xml = nil

    unless create_xml.nil?
      rkeeper = LineItem.find_by_sql("SELECT * FROM line_items WHERE cart_id = '#{cart_id}' and executed is null;")
      arr = []
      amount = 0
      count = 0
      rkeeper.each do |f|
        pizza = false
        sum = 0
        size = 1
        modif = ""
        arr_price = []
        arr_name = []
        unless f.pizza == true
          pr = Products.where('rkeeper1 = ? or rkeeper2 = ? or rkeeper3 = ?', f.rkeeper, f.rkeeper, f.rkeeper).first
          mo_pr = Products.find(f.has_modifier) unless f.has_modifier.nil?
          category = pr.category
          arr_price += [pr.price1, pr.price2, pr.price3]
          arr_name += [pr.name1, pr.name2, pr.name3]
          modif = nil
          case f.rkeeper
            when pr.rkeeper1
              sum = pr.price1
              modif = mo_pr.rkeeper1 unless f.has_modifier.nil?
            when pr.rkeeper2
              sum = pr.price2
              modif = mo_pr.rkeeper2 unless f.has_modifier.nil?
              size = 2
            when pr.rkeeper3
              sum = pr.price3
              modif = mo_pr.rkeeper3 unless f.has_modifier.nil?
              size = 3
          end
        else
          pizza = true
          rk = Rkeeper.where('code = ?', f.rkeeper).first
          price = Price.where('pizza_id = ? and size_id = ?', rk.pizza_id, rk.size_id ).first
          sum = price.price
          pr = Pizza.find(rk.pizza_id)
        end
        count += f.quantity
        amount += sum * f.quantity
        if f.pizza
          category = 'pizza'
        else
          category = pr.category
        end
        arr += [{ amount: sum,
                  id: f.id,
                  idd: pr.id,
                  name: pr.name,
                  price: arr_price,
                  name_arr: arr_name,
                  category: category,
                  rkeeper: f.rkeeper,
                  product_select: size,
                  description: pr.description,
                  pizza: pizza,
                  modifier: modif,
                  quantity: f.quantity }]
      end
      return {:pr => arr, :amount => amount, :count => count}
    else
      cookies_cart(vari)
      return true
    end

  end

  #lon = x
  #lat = y
  def pizzaria_in lat, lon
    Pizzeria.all.each do |pizzeria|
      first = true
      lat_first = false
      lon_first = false
      lat_last = false
      lon_last = false
      count = 0
      Coordinate.where('pizzeria_id = ?', pizzeria.id).order('id ASC').each do |coordinate|
        if first
          lat_first = coordinate.latitude
          lon_first = coordinate.longitude
          first = false
        else
          if ((((coordinate.latitude - lat) > 0) && ((lat_last - lat) < 0)) || (((coordinate.latitude - lat) < 0) && ((lat_last - lat) > 0)))
            y1 = lat_last - lat
            y2 = coordinate.latitude - lat
            x1 = lon_last - lon
            x2 = coordinate.longitude - lon
            x3 = ( y1 * x2 - y2 * x1 ) / ( y1 - y2 )
            if x3 > 0
              count += 1
            end
          end
        end
        lat_last = coordinate.latitude
        lon_last = coordinate.longitude
      end
      if ((((lat_first - lat) > 0) && ((lat_last - lat) < 0)) || (((lat_first - lat) < 0) && ((lat_last - lat) > 0)))
        y1 = lat_last - lat
        y2 = lat_first - lat
        x1 = lon_last - lon
        x2 = lon_first - lon
        x3 = ( y1 * x2 - y2 * x1 ) / ( y1 - y2 )
        if x3 > 0
          count += 1
        end
      end
      if count != 0
        if Integer(count/2) * 2 != count
          return pizzeria.id
        end
      end
    end
    false
  end
  private
  def cookies_cart(vari)
    #session[:cookie]=nil
    unless vari.nil?
      if vari[:pizza]
        if session[:cookie].nil?
          session[:cookie] = [{pizza: vari[:pizza],
                               id: vari[:id].to_i,
                               url: vari[:url],
                               name: vari[:name],
                               size: vari[:size].to_i,
                               dough: vari[:dough].to_i,
                               price: vari[:price].to_f,
                               quantity: 1}]
        else
          flag = true
          session[:cookie].each do |f|
            if (f[:id].to_s ==  vari[:id]) && (f[:pizza] ==  vari[:pizza]) && (f[:size] ==  vari[:size].to_i) && (f[:dough] ==  vari[:dough].to_i)
              f[:quantity] += 1
              flag = false
            end
          end
          if flag
            session[:cookie] += [{pizza: vari[:pizza],
                                  id: vari[:id].to_i,
                                  url: vari[:url],
                                  name: vari[:name],
                                  size: vari[:size].to_i,
                                  dough: vari[:dough].to_i,
                                  price: vari[:price].to_f,
                                  quantity: 1}]
          end
        end
      else


        #TODO
        # modifier в любом раскладе попадает - nil

        if vari[:set] == "false"
          vari[:set] = nil
        end

        if vari[:modifier]
          modifier = true
        else
          modifier = false
        end
        if session[:cookie].nil?
          session[:cookie] = [{pizza: vari[:pizza],
                               id: vari[:id].to_i,
                               url: vari[:url],
                               name: vari[:name],
                               size: vari[:size].to_i,
                               set: vari[:set],
                               price: vari[:price].to_f,
                               quantity: 1,
                               modifier: modifier}]
        else
          flag = true
          session[:cookie].each do |f|
            if (f[:id].to_s ==  vari[:id]) && (f[:pizza] ==  vari[:pizza]) && (f[:size] ==  vari[:size].to_i)
              f[:quantity] += 1
              flag = false
            end
          end
          if flag
            session[:cookie] += [{pizza: vari[:pizza],
                                  id: vari[:id].to_i,
                                  url: vari[:url],
                                  name: vari[:name],
                                  size: vari[:size].to_i,
                                  set: vari[:set],
                                  price: vari[:price].to_f,
                                  quantity: 1,
                                  modifier: modifier}]
          end
        end
      end
    end
    unless session[:cookie].nil?
      session[:price] = 0
      session[:count] = 0
      session[:cookie].each do |f|
        session[:price] += f[:price] * f[:quantity]
        session[:count] += f[:quantity]
      end
    end
  end
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  def admin?
    if current_user.nil?
      redirect_to login_url
    else
      redirect_to login_url unless current_user.admin?
    end
  end
  def manager?
    if current_user.nil?
      redirect_to login_url
    else
      redirect_to login_url unless current_user.manager?
    end
  end
  def admin_manager?
    if current_user.nil?
      redirect_to login_url
    else
      redirect_to login_url unless (current_user.manager? || current_user.admin?)
    end
  end
end
