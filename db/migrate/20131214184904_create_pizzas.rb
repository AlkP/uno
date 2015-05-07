class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string  :name
      t.text    :description
      t.float   :price1
      t.float   :price2
      t.float   :price3
      t.attachment :view_products

      t.timestamps
    end
  end
end
