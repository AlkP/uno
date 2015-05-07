class AddColumnsRKeeperToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :rkeeper1
      t.string :rkeeper2
      t.string :rkeeper3
    end
  end
end
