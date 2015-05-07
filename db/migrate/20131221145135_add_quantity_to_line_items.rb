class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.integer :quantity

    end
  end
end
