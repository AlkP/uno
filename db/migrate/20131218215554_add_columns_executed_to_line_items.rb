class AddColumnsExecutedToLineItems < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.boolean :executed
    end
  end
end
