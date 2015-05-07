class AddModalColumnToPizza < ActiveRecord::Migration
  def change
    change_table :pizzas do |t|
      t.boolean :modal_help
    end
  end
end
