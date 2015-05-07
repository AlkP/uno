class AddColumnPizzaToLineItems < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.boolean :pizza
    end
  end
end
