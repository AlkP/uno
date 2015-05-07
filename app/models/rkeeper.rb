class Rkeeper < ActiveRecord::Base
  belongs_to :size
  belongs_to :dough
  belongs_to :sauce

  belongs_to :products
  belongs_to :pizza

  validates :code, presence: true

  def self.save_pizza(size_id, dough_id, sauce_id, pizza_id,  code )
    rkeeper = new
    rkeeper.size = Size.find(size_id)
    rkeeper.dough = Dough.find(dough_id)
    rkeeper.sauce = Sauce.find(sauce_id)
    rkeeper.pizza = Pizza.find(pizza_id)
    rkeeper.code = code
    rkeeper.save
  end
  def self.save_products(size_id, dough_id, sauce_id, products_id,  code )
    rkeeper = new
    rkeeper.size = Size.find(size_id)
    rkeeper.dough = Dough.find(dough_id)
    rkeeper.sauce = Sauce.find(sauce_id)
    rkeeper.products = Products.find(products_id)
    rkeeper.code = code
    rkeeper.save
  end
end
