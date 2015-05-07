class Price < ActiveRecord::Base
  belongs_to :size

  belongs_to :products
  belongs_to :pizza

  validates :price, presence: true
  def self.save_pizza( size_id, pizza_id, price_v )
    price = new
    price.size = Size.find(size_id)
    price.pizza = Pizza.find(pizza_id)
    price.price = price_v
    price.save
  end
end
