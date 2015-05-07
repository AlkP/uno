class AddClassificationToPizza < ActiveRecord::Migration
  def change
    change_table :pizzas do |t|
      t.references :classification, index: true
    end
  end
end
