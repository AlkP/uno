class AddColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references  :pizzeria, index: true
      t.boolean     :admin
      t.boolean     :manager
    end
  end
end
