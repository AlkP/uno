class AddColumnKeeperToLineItems < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.string :rkeeper
    end
  end
end
