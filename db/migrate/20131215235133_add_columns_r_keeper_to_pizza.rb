class AddColumnsRKeeperToPizza < ActiveRecord::Migration
  def change
    change_table :pizzas do |t|
      t.string :rkeeper1
      t.string :rkeeper2
      t.string :rkeeper3
      t.string :rkeeper4
      t.string :rkeeper5
      t.string :rkeeper6
      t.string :rkeeper7
      t.string :rkeeper8
      t.string :rkeeper9
      t.string :rkeeper10
      t.string :rkeeper11
      t.string :rkeeper12
    end
  end
end
