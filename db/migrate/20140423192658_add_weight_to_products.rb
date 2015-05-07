class AddWeightToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.integer :weight
    end
  end
end
