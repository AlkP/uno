class AddModalColumnToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.boolean :modal_help
    end
  end
end
