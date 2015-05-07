class UserMailer < ActionMailer::Base
  default from: 'unomailer@podvorye.ru'

  def send_call(to, name, phone, town)
    @name  = name
    @phone = phone
    @town  = town
    mail(to: to, subject: 'Запрос на звонок')
  end

  def send_xml(to, user, basket)
    #recipients  'apasenko@gmail.com'
    #from        'aass@gmail.com'
    #subject     "Website quotation"
    #body        :basket=>basket
    name = "d_" + Time.now().strftime("%d%m%Y%H%M%S%Z").to_s + ".xml"
    name = name.gsub('MSK','000')
    attachments.inline[name] = ((generate_xml(user, basket))).gsub('item name=','').gsub('<"','<').gsub('">','>').gsub('<gsub>','<').gsub('</gsub>','>').gsub('</item>','')
    mail(to: to, subject: name)
  end

  def generate_xml(user, basket)

    require "builder"
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct! :xml, :version=>"1.0"
    xml.order do
      xml.f_name(user[:name])
      xml.l_name("")
      xml.m_name("")
      xml.organization("")
      xml.phone1(user[:phone])
      xml.phone2("")
      xml.town("")
      xml.street(user[:street])
      xml.house(user[:house])
      xml.building(user[:housing])
      xml.entry("")
      xml.flat(user[:apartment])
      xml.floor("")
      xml.codeentry("")
      xml.email(user[:email])
      xml.adv_info(user[:description])
      xml.advert("")
      xml.order_summ(basket[:amount])
      xml.d_type("0")
      xml.wait_time(Time.now().to_s[0..18])
      xml.menu do
        count = 0
        lunch_check = Hash.new
        basket[:pr].each do |item|
          count += 1
          name = 'itemnum'+count.to_s
          modifier = nil
          idd = nil
          size = nil
          if item[:modifier] != ""
            modifier = Products.where('rkeeper1 = ? or rkeeper2 = ? or rkeeper3 = ?',item[:modifier],item[:modifier],item[:modifier]).first

            variant = Variant.where('products_id = ? ', item[:idd])
            mod_true = true if variant.count == 1
            variant.each do |vv|
              content = Content.where('variants_id = ?', vv.id)
              content.each do |cc|
                if modifier.id == cc.idd
                  idd  = cc.idd
                  size = cc.size
                end
              end
            end

          end

          if !modifier.nil? and price_size_content(idd, size) == 0 and !mod_true and !lunch_check[item[:rkeeper]]
            xml.item(:name=> name) do
              xml.item id: item[:rkeeper], name: item[:name], quantity: item[:quantity], price: item[:amount]
            end
            lunch_check[item[:rkeeper]] = true
            count += 1
            name = 'itemnum'+count.to_s
          end

          if modifier.nil?
            xml.item(:name=> name) do
              xml.item id: item[:rkeeper], name: item[:name], quantity: item[:quantity], price: item[:amount]
            end
            xml.gsub('/itemnum'+count.to_s,'')
          else
            xml.item(:name=> name) do
              product = Products.find(idd)
              if price_size_content(idd, size) != 0
                xml.item id: item[:modifier], name: product.name, quantity: item[:quantity], price: price_size_content(idd, size)
              else
                if mod_true
                  xml.item id: item[:rkeeper], name: item[:name], quantity: item[:quantity], price: item[:amount]
                  if item[:modifier] != ""
                    xml.mod id: item[:modifier], name: modifier.name
                  end
                else
                  xml.item id: item[:modifier], name: product.name, quantity: item[:quantity], price: '0.00'
                end
              end
            end
            xml.gsub('/itemnum'+count.to_s,'')
          end
        end
      end
    end
  end



  #  @user = user
  #  @name =name
  #  @phone = phone
  #  @address = address
  #  @name_file = name_file
  #  attachments.inline[@name_file] = attachment
  #  mail(to: @user, subject: 'XML file')
  #end
  def price_size_content(id,size)
    pr = Products.find(id)
    case size
      when 1
        pr.price1
      when 2
        pr.price2
      when 3
        pr.price3
    end
  end

end
