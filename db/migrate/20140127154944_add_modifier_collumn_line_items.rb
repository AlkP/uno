class AddModifierCollumnLineItems < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.integer :has_modifier
    end
  end
end
