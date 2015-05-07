class AddSetPizza < ActiveRecord::Migration
  def change
    change_table :pizzas do |t|
      t.boolean :sets
    end
  end
end
