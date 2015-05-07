class AddColumnSetProdocts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.boolean :set
    end
  end
end
