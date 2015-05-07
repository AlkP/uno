module SendformsHelper
  def name_size_content(id,size)
    pr = Products.find(id)
    case size
      when 1
        pr.name1
      when 2
        pr.name2
      when 3
        pr.name3
    end
  end
end
