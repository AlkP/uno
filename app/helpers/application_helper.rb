module ApplicationHelper

  def init_variable
    now_hours = Time.now.hour
    now_min   = Time.now.min

    # Проверка ланча
    @check_to_lunch = false
    if now_hours >= 11 and now_hours < 16
      @check_to_lunch = true
    end

    @lunch_hours    = 11 - Time.now.hour
    @lunch_hours += 23 if @lunch_hours < 0
    @lunch_minutes  = 60 - Time.now.min


    # Проверка рабочего времени
    @check_to_work = false
    if now_hours >= 10 and now_hours < 17
      @check_to_work = true
    end
  end

  def init_variable_pizzas
    @hash_classification = Hash.new
    @hash_dough = Hash.new
    @hash_rkeeper = Hash.new
    @hash_size = Hash.new
    @hash_price = Hash.new

    Classification.all.each do |classification|
      @hash_classification[classification.id] = classification.name
    end

    Dough.all.each do |dough|
      @hash_dough[dough.id] = { name: dough.name, sname: dough.short_name }
    end

    Rkeeper.all.each do |rkeeper|
      sauce = { rkeeper.sauce_id => rkeeper.id }
      dough = { rkeeper.size_id => sauce }
      if (@hash_rkeeper[rkeeper.pizza_id].nil?)
        @hash_rkeeper[rkeeper.pizza_id] = { rkeeper.dough_id => dough }
      else
        if ( @hash_rkeeper[rkeeper.pizza_id][rkeeper.dough_id].nil? )
          @hash_rkeeper[rkeeper.pizza_id][rkeeper.dough_id] = dough
        else
          if ( @hash_rkeeper[rkeeper.pizza_id][rkeeper.dough_id][rkeeper.size_id].nil? )
            @hash_rkeeper[rkeeper.pizza_id][rkeeper.dough_id][rkeeper.size_id] = { rkeeper.sauce_id => rkeeper.id }
          else
            @hash_rkeeper[rkeeper.pizza_id][rkeeper.dough_id][rkeeper.size_id][rkeeper.sauce_id] = rkeeper.id
          end
        end
      end
    end

    Size.all.each do |size|
      @hash_size[size.id] = size.short_name
    end

    Price.all.each do |price|
      if (@hash_price[price.pizza_id].nil?)
        @hash_price[price.pizza_id] = { price.size_id => price.price }
      else
          @hash_price[price.pizza_id][price.size_id] = price.price
      end
    end
  end

end
